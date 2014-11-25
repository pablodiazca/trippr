class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :description
    devise_parameter_sanitizer.for(:account_update) << :country
  end

  def after_sign_in_path_for(resource)
    posts_path
  end

  def layout_by_resource
  if devise_controller? && resource_name == :user && action_name == "edit"
    "application"
  else
    "other"
  end
end
end
