class FurnituresController < ApplicationController

  before_action :set_furniture, only: [:show, :new, :update, :destroy]

  def index
    @furnitures = Furniture.all
  end

  def show
  end

  def new
    @furniture = Furniture.new
  end

  def create
    @furniture = Furniture.new(furniture_params)
    if @furniture.save
      redirect_to furniture_path(@furniture)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @furniture.update(furniture_params)
      redirect_to furniture_path(@furniture)
    else
      render :edit
    end
  end

  def destroy
    @furniture.destroy
    redirect_to furnitures_path
  end

  private

  def set_furniture
    @furniture = Furniture.find(params[:id])
  end

  def furniture_params
    params.require(:furniture).permit(:name)
  end

end
