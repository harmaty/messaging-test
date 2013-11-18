# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  content      :text
#  recipient_id :integer
#  sender_id    :integer
#  is_read      :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

class Message < ActiveRecord::Base
  belongs_to :sender, class_name: User, foreign_key: :sender_id
  belongs_to :recipient, class_name: User, foreign_key: :recipient_id

  validates_presence_of :sender
  validates_presence_of :recipient
  validates_presence_of :content

  scope :unread, ->{ where(is_read: false) }

end
