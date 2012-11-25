class VolunteersController < ApplicationController
  before_filter :authenticate_volunteer!
  before_filter :profile_complete?, :except =>['profile']
  
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

  private
    #If the user's profile is not complete, redirect them to the edit profile page
    def profile_complete?
      unless current_volunteer.profile_complete
        redirect_to :action => 'profile'
      end
    end
end