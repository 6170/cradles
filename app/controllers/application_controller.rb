class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_global_gon

  def set_global_gon
    #make params availible to js context
    gon.params = params
  end
end
