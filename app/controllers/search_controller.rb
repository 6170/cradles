class SearchController < ApplicationController
  before_filter :authenticate_teacher!, :except =>['autocomplete_school_names']
  def autocomplete_school_names
    @schools = School.search do
      if params[:query]
        with(:name_lower).starting_with(params[:query].downcase)
      end
      if params[:lat] and params[:lng]
        with(:coordinates).near(params[:lat], params[:lng], :boost => 2, :precision => 2)
      end
      paginate(:page => 1, :per_page => 100)
    
    end
    render json: @schools.results
  end

  def index
    
    @volunteers = Volunteer.search do
      with(:schools, current_teacher.school_name)
      facet :interests
      with(:interests, params[:interests]) if params[:interests].present?
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @volunteers.results }
    end
  end

end