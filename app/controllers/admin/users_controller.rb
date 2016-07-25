class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user_ink = User_ink.find_by(params[:user_id])
    user_ink.destroy unless user_ink.nil?
    user.destroy
    redirect_to admin_users_path
  end
end
