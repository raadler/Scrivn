class InksController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]

  def index
    @inks = Ink.all.order('color_name ASC')
  end

  def show
    @ink = Ink.find(params[:id])
  end

  def new
    @ink = Ink.new

    unless user_signed_in?
      flash[:error] = 'You must be signed in to add a new ink.'
      redirect_to inks_path
    end
  end

  def create
    @ink = Ink.new(ink_params)

    if @ink.save
      flash[:notice] = "Ink successfully added!"
      redirect_to ink_path(@ink)
    else
      flash[:notice] = "There were problems saving your ink."
      flash[:errors] = @ink.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @ink = Ink.find(params[:id])
    @submit = "Save Changes"
  end

  def update
    @ink = Ink.find(params[:id])

    if @ink.update_attributes(ink_params)
      flash[:notice] = "Ink successfully saved!"
      redirect_to @ink
    else
      flash[:notice] = "There were problems saving your ink."
      flash[:errors] = @ink.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    Ink.find(params[:id]).destroy
    redirect_to inks_path
  end

  private

  def ink_params
    params.require(:ink).permit(
      :color_name, :manufacturer, :description, :line, :ink_pic
    )
  end
end
