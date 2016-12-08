class UsersController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
  end

  def show
    @user = current_user
    render :show
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
