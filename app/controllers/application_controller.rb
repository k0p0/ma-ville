class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || city_path(current_user.city_id)
  end
end
