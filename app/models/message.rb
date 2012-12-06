class Message < ActiveRecord::Base
  attr_accessible :content, :from, :to, :conversation_id, :was_read
  validate :content, :on => :create
  belongs_to :conversation
  after_save :notify

  def notify
    NotificationMailer::deliver_message_notification(self)
  end
end
