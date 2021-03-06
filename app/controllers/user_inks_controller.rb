class UserInksController < ApplicationController
  before_action :authenticate_user!

  def show
    @user_ink = UserInk.find(params[:id])
    @user = current_user
    @ink = Ink.find(@user_ink.ink_id)
  end

  def create
    @user = current_user
    @user_ink = UserInk.new
    @ink = Ink.find(params[:ink_id])
    @user_ink.user_id = @user.id
    @user_ink.ink_id = @ink.id

    if @user_ink.save
      flash[:notice] = 'Ink successfully added to collection!'
      redirect_to user_user_ink_path(@user, @user_ink)
    else
      flash[:notice] = "There were problems adding your ink."
      flash[:errors] = @user_ink.errors.full_messages.join(", ")
      redirect_to ink_path(@ink)
    end
  end

  def edit
    @user_ink = UserInk.find(params[:id])
    @ink = Ink.find(@user_ink.ink_id)
    @user = User.find(@user_ink.user_id)
  end

  def update
    @user = current_user
    @user_ink = UserInk.find(params[:id])
    @user_ink.user = @user
    if @user_ink.update(user_ink_params)
      flash[:notice] = 'Ink successfully updated'
      redirect_to user_user_ink_path(@user, @user_ink)
    else
      flash[:notice] = 'There were problems saving your ink.'
      flash[:errors] = @user_ink.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @user_ink = UserInk.find(params[:id])
    @user = current_user
    @user_ink.destroy
    flash[:notice] = 'Ink deleted!'
    redirect_to user_path(@user)
  end

  private

  def user_ink_params
    params.require(:user_ink).permit(
      :ink_id,
      :user_id,
      :color_family,
      :is_cartridge,
      :is_bottled,
      :cartridge_size,
      :bottle_size,
      :notes,
      :num_bottles,
      :num_cartridges,
      :favorite,
      :will_sell
    )
  end
end
