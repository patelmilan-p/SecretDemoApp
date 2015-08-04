class UsersController < ApplicationController
  #before_action authenticate_user!

  def show
    if user_signed_in?
      @user = current_user
    end
  end
end
