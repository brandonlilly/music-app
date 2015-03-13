class UsersController < ApplicationController
  before_action :require_not_logged_in, only: [:new, :create]

  def show
    @user = current_user
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to root_url
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

end
