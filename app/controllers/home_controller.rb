class HomeController < ApplicationController
  before_filter :redirect_to_user_page

  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  private
    #Redirects a user to their usertype homepage if they are logged in.
    def redirect_to_user_page
      if teacher_signed_in?
        redirect_to :controller => 'teachers'
      elsif volunteer_signed_in?
        redirect_to :controller => 'volunteers'
      end
    end
end