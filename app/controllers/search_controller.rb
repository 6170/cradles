class SearchController < ApplicationController
  before_filter :authenticate_teacher!, :except =>['autocomplete_school_names']
  def autocomplete_school_names
    @schools = School.search do
      with(:name_lower).starting_with(params[:query].downcase)
    end
    render json: @schools.results.map { |school| school.name}
  end

  def index
    @volunteer_search = Volunteer.search do
      facet :schools
    end
    
    respond_to do |format|
      format.html
    end
  end

end