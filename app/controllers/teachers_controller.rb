class TeachersController < ApplicationController
  before_filter :authenticate_teacher!
  def index
    respond_to do |format|
      format.html 
      format.json { render json: {}}
    end
  end

end