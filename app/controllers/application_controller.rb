class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  attr_reader :body_class
  helper_method :body_class
  #http_basic_authenticate_with name: 'do', password: 'rnovka' if Rails.env.production?
end
