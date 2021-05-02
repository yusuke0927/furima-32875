class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :name_chinese_character_last_name, :name_chinese_character_first_name, :name_catakana_last_name, :name_catakana_first_name, :birthday])
  end
end
