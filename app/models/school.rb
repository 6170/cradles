class School < ActiveRecord::Base
  attr_accessible :name, :lat, :lng, :zipcode, :school_type, :location
  validates :name, :uniqueness => true
  has_and_belongs_to_many :volunteers
  searchable do
    string :name_lower do
      name.downcase
    end
  end
end
