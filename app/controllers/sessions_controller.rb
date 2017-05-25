class SessionsController < ApplicationController

  def home

  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email_address: params[:user][:email_address].downcase)

    if @user && @user.authenticate(params[:user][:password])
      flash[:message] = "Welcome to Stock Robot #{@user.email_address}!"
      session[:user_id] = @user.id
      redirect_to tickers_path
    else
      flash[:message] = "Login Failed!"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to "/home"
  end

end
