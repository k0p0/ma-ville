class CitiesController < ApplicationController

  before_action :set_city, only: [:show, :update, :infos]
  skip_before_action :authenticate_user!, only: [:show, :index, :infos]

  # def index
  #   @cities = City.all
  # end

  def show
    if current_user && current_user.city == @city
      @reports = @city.reports.all.where.not(report_latitude: nil, report_longitude: nil)
      @hash = Gmaps4rails.build_markers(@reports) do |report, marker|
        marker.lat report.report_latitude
        marker.lng report.report_longitude
        marker.infowindow render_to_string(partial: "/cities/map_box", locals: { report: report })
        # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
        case report.status_id
        # id: 1, name: "En attente de traitement"
        when 1 then marker.picture({ url: ActionController::Base.helpers.asset_path("red.png"), width: 46, height: 46 })
          # id: 2, name: "Commande en cours"
        when 2 then marker.picture({ url: ActionController::Base.helpers.asset_path("yellow.png"), width: 46, height: 46 })
          # id: 3, name: "Intervention programmée"
        when 3 then marker.picture({ url: ActionController::Base.helpers.asset_path("yellow.png"), width: 46, height: 46 })
          # id: 4, name: "Intervention en cours"
        when 4 then marker.picture({ url: ActionController::Base.helpers.asset_path("orange.png"), width: 46, height: 46 })
          # id: 5, name: "Résolu"
        when 5 then marker.picture({ url: ActionController::Base.helpers.asset_path("green.png"), width: 46, height: 46 })
          # id: 6, name: "Annulé"
        when 6 then marker.picture({ url: ActionController::Base.helpers.asset_path("lightblue.png"), width: 46, height: 46 })
        end
      end
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @city.update(city_params)
      redirect_to city_path(@city)
    else
      render :edit
    end
  end

  def infos
    show
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :zip_code, :insee_code, :city_latitude, :city_longitude, :population, :density, :area, :mayor, :region, :department, :council_address, :council_phone, :council_website, :council_email)
  end
end
