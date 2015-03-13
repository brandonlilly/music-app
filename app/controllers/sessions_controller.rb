class SessionsController < ApplicationController
  before_action :require_not_logged_in, only: [:new, :create]
  before_action :require_login, only: [:destroy, :index]

  def index

  end

  def new
    @user = User.new(email: params[:email])
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      log_in_user!(@user)
      redirect_to user_url
    else
      @user = User.new(email: params[:email])
      flash.now[:errors] = "Invalid login"
      render :new
    end
  end

  def destroy
    current_session = current_user.sessions.find(params[:id])
    if current_session.nil?
      flash[:errors] = "No such session"
    else
      session[:token] = nil if current_session.token == session[:token]
      current_session.destroy!
    end
    redirect_to root_url
  end



end
