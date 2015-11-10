class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :restrict_access # API security 2-r arga
  #   # API security 1-r arge
  http_basic_authenticate_with name: "admin", password: "secret"
  
  private
#   # API security 2-r arga
    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(access_token: token)
      end
    end
  
end
