class UsersController < ApplicationController
  def index
    if User.count == 0
      redirect_to new_user_registration_path
    elsif user_signed_in? == false
      redirect_to new_user_session_path
    else
      @user = current_user
    end
  end
end
