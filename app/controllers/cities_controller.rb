class CitiesController < ApplicationController

  before_action :set_visitor_city, only: [ :infos]
  before_action :set_user_city, only: [:show, :update]
  skip_before_action :authenticate_user!, only: [:show, :index, :infos]

  def show
    if current_user && current_user.city == @city
      @reports = @city.reports.all.where.not(report_latitude: nil, report_longitude: nil)
      @attente = 0
      @cours = 0
      @prog = 0
      @resolu = 0
      @hash = Gmaps4rails.build_markers(@reports) do |report, marker|
        marker.lat report.report_latitude
        marker.lng report.report_longitude
        marker.infowindow render_to_string(partial: "/cities/map_box", locals: { report: report })

        case report.status.name
        when "En attente de traitement"
          then marker.picture({ url: ActionController::Base.helpers.asset_path("red.png"), width: 46, height: 46 }) and @attente += 1
        when "Commande en cours"
          then marker.picture({ url: ActionController::Base.helpers.asset_path("yellow.png"), width: 46, height: 46 }) and @cours += 1
        when "Intervention programmée"
          then marker.picture({ url: ActionController::Base.helpers.asset_path("yellow.png"), width: 46, height: 46 }) and @prog += 1
        when "Intervention en cours"
          then marker.picture({ url: ActionController::Base.helpers.asset_path("orange.png"), width: 46, height: 46 }) and @cours += 1
        when "Résolu"
          then marker.picture({ url: ActionController::Base.helpers.asset_path("green.png"), width: 46, height: 46 }) and @resolu +=1
        when "Annulé"
          then marker.picture({ url: ActionController::Base.helpers.asset_path("lightblue.png"), width: 46, height: 46 }) and @resolu +=1
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
      redirect_to city_path
    else
      render :edit
    end
  end

  def infos
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
  end

  private

  def set_visitor_city
    @city = City.find(params[:id])
  end

  def set_user_city
    @city = current_user.city
  end

  def city_params
    params.require(:city).permit(:name, :zip_code, :insee_code, :city_latitude, :city_longitude, :population, :density, :area, :mayor, :region, :department, :council_address, :council_phone, :council_website, :council_email)
  end
end
