class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :body_class
  http_basic_authenticate_with name: 'dorn', password: 'ovka' if Rails.env.production?

  protected

  def body_class
    ""
  end
end
