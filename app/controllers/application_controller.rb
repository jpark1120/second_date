class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    if current_user
      current_user
    else
      redirect_to root_path
    end

  end


  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def authenticate_with_basic_auth
  #   unless @current_user
  #     authenticate_or_request_with_http_basic do |email, password|
 
  #       @current_user = User.authenticated?(email, password)

  #     end
  #   else
  #     @current_user
  #   end
  # end


  # helper_method :current_user

  # def current_user
  #   @current_user
  # end

end
