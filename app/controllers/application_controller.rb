class ApplicationController < ActionController::Base
  before_action :devise_parameter_sanitizer, if: :devise_controller?
  private

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
    end
  end

  def after_sign_in_path_for(user)
    user_path(user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
  
end
