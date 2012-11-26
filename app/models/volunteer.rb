class Volunteer < ActiveRecord::Base
  has_and_belongs_to_many :schools
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :interests
  validates_presence_of :first_name, :last_name, :interests, :on => :update

  def set_school_list(school_list)
    schools.clear()
    #create association
    for school_name in school_list
      school = School.find_or_create_by_name(school_name)
      schools << school
    end
  end
end
