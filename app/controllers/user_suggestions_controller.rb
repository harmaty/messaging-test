class UserSuggestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.suggestions_for params[:term]
    render json: @users.map{|user| {value: user.name, id: user.id}}
  end
end