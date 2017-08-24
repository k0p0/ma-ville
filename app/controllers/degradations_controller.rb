class DegradationsController < ApplicationController

  before_action :set_degradation, only: [:show, :new, :update, :destroy]

  def index
    @degradations = Degradation.all
  end

  def show
  end

  def new
    @degradation = Degradation.new
  end

  def create
    @degradation = Degradation.new(degradation_params)
    if @degradation.save
      redirect_to degradation_path(@degradation)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @degradation.update(degradation_params)
      redirect_to degradation_path(@degradation)
    else
      render :edit
    end
  end

  def destroy
    @degradation.destroy
    redirect_to degradations_path
  end

  private

  def set_degradation
    @degradation = Degradation.find(params[:id])
  end

  def degradation_params
    params.require(:degradation).permit(:name)
  end
end
