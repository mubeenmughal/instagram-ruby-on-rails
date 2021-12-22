# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :info, :danger, :warning,:success
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password confirm_password account_type avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password confirm_password account_type avatar])

  end
end
