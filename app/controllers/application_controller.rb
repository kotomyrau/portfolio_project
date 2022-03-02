class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :auth_viewer

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:about, :avatar])
  end

  def auth_viewer
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV["VIEWER_NAME"] && password == ENV["VIEWER_PASSWORD"] 
    end
  end
end
