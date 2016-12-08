class UsersController < ApplicationController
  before_action :redirect_if_logged_in

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      login_user(user)
    else
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
