# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :info, :danger, :warning, :success

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_url, alert: 'You do not have access to this page.'
  end

  rescue_from ActiveRecord::RecordNotFound do
    render file: 'public/404.html', status: :not_found
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password confirm_password account_type avatar])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email password confirm_password account_type avatar])
  end
end
