class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :noodle_id, :soup_id, :meat_id, :vegetable_id, :garlic_id, :oil_id])
  end
end
