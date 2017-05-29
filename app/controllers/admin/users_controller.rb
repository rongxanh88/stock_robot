class Admin::UsersController < AuthenticatedController
  before_action :set_user, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    @user.update_attributes(user_params)
    
    if @user.save
      flash[:message] = "User Updated!"
      redirect_to console_path
    else
      flash[:message] = "Unable to make changes"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:message] = "User Deleted!"

    redirect_to console_path
  end
  
  private

  def user_params
    params.require(:user).permit(:email_address, :password, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end
end