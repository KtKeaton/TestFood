class UsersController < ApplicationController
  
  def sign_in
    @user = User.new
  end

  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to recipes_path
    else
      render :sign_up
    end
  end  

private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end
end

