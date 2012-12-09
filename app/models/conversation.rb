class Conversation < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :volunteer
  has_many :messages
  attr_accessible :volunteer_id, :teacher_id, :v_read, :t_read
end
