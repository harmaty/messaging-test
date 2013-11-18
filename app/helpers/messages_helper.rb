module MessagesHelper
  def unread_inbox_messages_count
    count = current_user.inbox_messages.unread.count
    if count > 0
      " (#{count})"
    else
      ""
    end
  end
end
