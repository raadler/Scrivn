class PensController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pens = Pen.all.order('name ASC')
  end

  def show
    @pen = Pen.find(params[:id])
  end

  def new
    @pen = Pen.new

    unless user_signed_in?
      flash[:error] = 'You must be signed in to add a new pen.'
      redirect_to pens_path
    end
  end

  def create
    @pen = Pen.new(pen_params)

    if @pen.save
      flash[:notice] = "Pen successfully added!"
      redirect_to pen_path(@pen)
    else
      flash[:notice] = "There were problems saving your pen."
      flash[:errors] = @pen.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    @pen = Pen.find(params[:id])

    if @pen.update_attributes(pen_params)
      flash[:notice] = "Pen successfully saved!"
      redirect_to @pen
    else
      flash[:notice] = "There were problems saving your pen."
      flash[:errors] = @pen.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    Pen.find(params[:id]).destroy
    redirect_to pens_path
  end

  private

  def pen_params
    params.require(:pen).permit(
      :name, :manufacturer, :description, :line, :filling_mechanism
    )
  end


end
