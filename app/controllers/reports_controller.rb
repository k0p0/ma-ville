class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create, :show]

  def index
    @reports = Report.all
  end

  def show
    @reports = Report.all
    @messages = Message.all
    @hash = Gmaps4rails.build_markers(@report) do |report, marker|
      marker.lat report.report_latitude
      marker.lng report.report_longitude
    @status = Status.all
    end
    # raise

  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.submit_date = Time.now
    @report.city = City.find_by(name: params[:report][:city])
    if @report.save
      flash[:notice] = "Votre incident a bien été envoyé à la commune de #{@report.city.name}"
      redirect_to infos_city_path(@report.city_id)
    else
      flash[:alert] = "Erreur, saisir à nouveau"
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
