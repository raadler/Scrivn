class UserInksController < ApplicationController
  before_action :authenticate_user!
  @current_user = current_user.id

  def show
    @user_ink = UserInk.find(params[:id])
    @current_user = current_user.id
    @ink = Ink.find(@user_ink.ink_id)
    @color_name = @ink.color_name
    @manufacturer = @ink.manufacturer
    @line = @ink.line
    @description = @ink.description
  end

  def create
    @user_ink = UserInk.new
    @ink = Ink.find(params[:ink_id])
    @user_ink.user_id = @current_user
    @user_ink.ink_id = @ink

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
    @color_name = @ink.color_name
    @user = User.find(@user_ink.user_id)
    @submit = "Save Changes"
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
