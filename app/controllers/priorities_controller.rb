class PrioritiesController < ApplicationController
  before_action :set_priority, only: [:show, :new, :update, :destroy]

  def index
    @priorities = Priority.all
  end

  def show
  end

  def new
    @priority = Priority.new
  end

  def create
    @priority = Priority.new(priority_params)
    if @priority.save
      redirect_to priority_path(@priority)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @priority.update(priority_params)
      redirect_to priority_path(@priority)
    else
      render :edit
    end
  end

  def destroy
    @priority.destroy
    redirect_to priorities_path
  end

  private

  def set_priority
    @priority = Priority.find(params[:id])
  end

  def priority_params
    params.require(:priority).permit(:name)
  end
end
