class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def login_user(user)
    client = request.env["HTTP_USER_AGENT"]
    new_token = SessionToken.generate_token!(user, client)
    session[:session_token] = new_token.token
    redirect_to cats_url
  end

  def log_out
    remove_token = SessionToken.find_by_token(session[:session_token])
    remove_token.destroy
    session[:session_token] = nil
    redirect_to cats_url
  end

  def current_user
    @current_user ||=
      SessionToken.find_user_with_token(session[:session_token])
  end

  private

  def redirect_if_logged_in
    if current_user
      redirect_to cats_url
    end
  end
end
