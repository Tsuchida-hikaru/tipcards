class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :publish_setting, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :publish_setting, :avatar])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to pages_url
    end
  end
end
