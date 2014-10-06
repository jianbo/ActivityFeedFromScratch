class ApplicationController < ActionController::Base
  include ControllerHelpers::StrongParameters
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  respond_to :json, :html
  
  def feed_activity(trackable, action = params[:action])
    current_user.activities.create!(action: action, trackable: trackable)
  end
  
  protected

  def configure_permitted_parameters    
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
  end

  def layout_by_resource
    if devise_controller?
      "devise_layout"
    else
      "application"
    end
  end
end
