class Admin::UsersController < AuthenticatedController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    @user.destroy
    flash[:message] = "User Deleted!"

    redirect_to console_path
  end
  
  private

  def user_params
    params.require(:user).permit(:email_address, :password, :role)
  end
end