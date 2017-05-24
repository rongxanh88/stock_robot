class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash.now[:message] = "User account creation successful!"
      redirect_to login_path
    else
      #sad path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password_digest)
  end
end
