class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:create, :new]

  def new
  end

  def create
    user = User.find_by_credentials(
      user_params[:username],
      user_params[:password]
    )

    if user
      login_user(user)
    else
      render :new
    end
  end

  def destroy
    log_out
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
