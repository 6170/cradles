class Message < ActiveRecord::Base
  attr_accessible :content, :from, :to, :conversation_id, :was_read
  validate :content, :on => :create
  belongs_to :conversation
  after_create :notify

  def notify
    NotificationMailer.notification(self).deliver
  end
end
