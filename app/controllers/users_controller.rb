class UsersController < ApplicationController
  def index
    if User.count == 0
      redirect_to new_user_registration_path
    elsif User.count == 1
      redirect_to new_user_session_path
    elsif user_signed_in?
      @user = current_user
    end
  end
end
