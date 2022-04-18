class ApplicationController < ActionController::Base
	helper_method :user_signed_in?, :current_user
			
private
  def user_signed_in?
    session[:random2022] != nil
  end
			
  def current_user
    if user_signed_in?
      User.find(session[:random2022])
    else
      nil
    end
  end
			
  def check_login!
    if not user_signed_in?
      redirect_to "/users/sign_in"
    end
  end

end
