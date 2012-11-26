class Teacher < ActiveRecord::Base
  has_one :school
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
end
