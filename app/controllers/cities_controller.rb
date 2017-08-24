class CitiesController < ApplicationController
    before_action :set_city, only: [:show, :update]
    skip_before_action :authenticate_user!, only: [:show]

  def index
    @cities = City.all
  end

  def show
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

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :zip_code, :insee_code, :city_latitude, :city_longitude, :population, :density, :area, :mayor, :region, :department, :council_address, :council_phone, :council_website, :council_email)
  end
end
