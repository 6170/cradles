class VolunteersController < ApplicationController
  before_filter :authenticate_volunteer!
  before_filter :profile_complete?, :except =>['profile', 'update_profile']
  
  def index
    respond_to do |format|
      format.html
    end
  end

  def profile
    #attach schools to the js context so they are rendered
    gon.schools = current_volunteer.schools.pluck(:name).uniq
    
    respond_to do |format|
      format.html
    end
  end

  def update_profile
    #remove association
    current_volunteer.schools.clear()
    #create association
    for school_name in params[:schools]
      school = School.find_or_create_by_name(school_name)
      current_volunteer.schools << school
    end
    
    #update user info
    respond_to do |format|
      if current_volunteer.update_attributes(params[:volunteer])
        format.html { redirect_to :action => 'profile', notice: 'Profile was successfully updated.' }
      else
        format.html { render action: "profile", notice: 'Please fix' }
      end
    end
  end

  private
    #If the user's profile is not complete, redirect them to the edit profile page
    def profile_complete?
      unless current_volunteer.profile_complete
        redirect_to :action => 'profile'
      end
    end
end