module MessagesHelper
  def unread_messages_count folder

    messages = current_user.send "#{folder}_messages"
    count = messages.unread.count
    if count > 0
      "(#{count})"
    end

  end
end
