class VolunteersController < ApplicationController
  before_filter :authenticate_volunteer!
  before_filter :profile_complete?, :except =>['profile', 'update_profile']
  before_filter :attach_schools
  before_filter :attach_interests
  
  def index
    respond_to do |format|
      format.html
    end
  end

  def profile
    respond_to do |format|
      format.html
    end
  end

  def update_profile
    current_volunteer.set_school_list(params[:schools])
    params[:volunteer][:interest_ids] ||= []
    respond_to do |format|
      if current_volunteer.update_attributes(params[:volunteer])
        current_volunteer.profile_complete = true
        current_volunteer.save()
        flash[:notice] = 'Profile was successfully updated.'
        format.html { redirect_to :action => 'index' }
      else
        format.html { render action: "profile" }
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

    def attach_schools
      #attach schools to the js context so they are rendered
      gon.schools = current_volunteer.schools.pluck(:name).uniq
    end
    def attach_interests
      @interests = Interest.all()
    end
end