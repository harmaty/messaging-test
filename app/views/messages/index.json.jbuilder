json.array!(@messages) do |message|
  json.extract! message, :content, :recipient_id, :sender_id, :is_read
  json.url message_url(message, format: :json)
end
