class School < ActiveRecord::Base
  attr_accessible :name, :lat, :lng, :zipcode, :school_type, :location
  validates :name, :uniqueness => true
  has_and_belongs_to_many :volunteers
  
  def as_json(options={})
  super(:only => [:name, :lat, :lng, :school_type])
  end


  searchable do
    location :coordinates do
      Sunspot::Util::Coordinates.new(lat, lng)
    end

    string :name_lower do
      name.downcase
    end
  end
end
