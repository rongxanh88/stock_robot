class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.update_attributes(email_address: params[:user][:email_address].downcase)
    if @user.save
      flash[:message] = "User account creation successful!"
      redirect_to login_path
    else
      flash[:message] = "User account creation unsuccessful!"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password)
  end
end
