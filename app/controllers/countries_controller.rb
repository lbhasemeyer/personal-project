class CountriesController < ApplicationController

  before_action :authorize_admin

  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to countries_path
    else
      render :new
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    @country.update(country_params)
    redirect_to countries_path
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    redirect_to countries_url
  end


  private

  def authorize_admin
    unless current_user.admin?
      raise AccessDenied
    end
  end

  def country_params
    params.require(:country).permit(:region, :code)
  end

end
