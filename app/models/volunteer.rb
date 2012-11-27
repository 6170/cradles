class Volunteer < ActiveRecord::Base
  has_and_belongs_to_many :schools
  has_and_belongs_to_many :interests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :interests, :interest_ids
  validates_presence_of :first_name, :last_name, :interests, :on => :update

  searchable do
    string :first_name
    string :last_name
    string :schools, :multiple => true do
      schools.map { |school| school.name }
    end
  end

  def set_school_list(school_list)
    schools.clear()

    for school_name in school_list
      school = School.find_or_create_by_name(school_name)
      schools << school
    end
  end
end
