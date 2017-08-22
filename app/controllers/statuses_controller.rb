class StatusesController < ApplicationController
  before_action set_status, only: [:show, :new, :update, :destroy]

  def index
    ## ATTENTION ICI LE PLURIEL DE STATUS EST STATUSES QUI N'EXISTEPAS
    @statuses = Status.all
  end

  def show
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to status_path(@status)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @status.update(status_params)
      redirect_to status_path(@status)
    else
      render :edit
    end
  end

  def destroy
    @status.destroy
    ## ATTENTION ICI LE PATH N'EST PAS STATUSES_PATH
    redirect_to status_index_path
  end

  private

  def set_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:name)
  end
end
