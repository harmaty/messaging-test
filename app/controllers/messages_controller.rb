class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :destroy]
  before_action :mark_as_read, only: [:show]


  # GET /messages
  # GET /messages.json
  def index
    @folder = if params[:folder] && params[:folder] == 'sent'
                'sent'
              else
                'inbox'
              end
    @messages = current_user.send("#{@folder}_messages").order(:created_at => :desc)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = current_user.messages.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:content, :recipient_id).merge(sender_id: current_user.id)
  end

  def mark_as_read
    if !@message.is_read? and @message.recipient_id == current_user.id
      @message.update_attribute(:is_read, true)
    end
  end
end
