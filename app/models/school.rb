class School < ActiveRecord::Base
  attr_accessible :name
  validates :name, :uniqueness => true
  has_and_belongs_to_many :volunteers
end
