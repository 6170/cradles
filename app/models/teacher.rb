class Teacher < ActiveRecord::Base
  belongs_to :school, :primary_key => "name", :foreign_key => "school_name"
  has_and_belongs_to_many :conversations
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :school_name
end
