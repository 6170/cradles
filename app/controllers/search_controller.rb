class SearchController < ApplicationController
  before_filter :authenticate_teacher!, :except =>['autocomplete_school_names']
  def autocomplete_school_names
    @schools = School.search do
      if params[:query]
        with(:name_lower).starting_with(params[:query].downcase)
      end
      if params[:lat] and params[:lng]
        with(:coordinates).near(params[:lat], params[:lng])
      end
      paginate(:page => 1, :per_page => 100)
    
    end
    render json: @schools.results
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