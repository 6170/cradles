class Interest < ActiveRecord::Base
  has_and_belongs_to_many :volunteers

  attr_accessible :name
  validates_presence_of :name
end
