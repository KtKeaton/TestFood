require 'digest'

class SessionsController < ApplicationController
  # before_action :check_login!, except: [:index, :show]

  def create
	  pw = user_params[:password]
	  salted_pw = "eiojre#{pw}rewropwr"
	  hashed_password = Digest::SHA1.hexdigest(salted_pw)
	  user = User.find_by(email: user_params[:email],
			                  password: hashed_password)
	  if user
	    session[:random2022] = user.id
	    redirect_to recipes_path
	  else
	    redirect_to "/users/sign_in", :notice => I18n.t(:user_pw_wrong)
	  end
  end

  def destroy
	  session[:random2022] = nil
	  redirect_to "/"
	end
			
private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end

end
