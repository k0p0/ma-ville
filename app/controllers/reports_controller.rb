class ReportsController < ApplicationController
  before_action set_report, only: [:show, :new, :update, :destroy]

  def index
    @reports = Report.all
  end

  def show
    @message = Message.new
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to report_path(@report)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to report_path(@report)
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_path
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:resolution_date, :submit_date, :address, :report_latitude, :report_longitude, :picture, :description, :degradation_id, :furniture_id, :city_id, :priority_id, :status_id)
  end
end
