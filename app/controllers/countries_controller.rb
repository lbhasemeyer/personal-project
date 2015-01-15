class CountriesController < MarketingController

  def index
    @countries = Country.all
  end

  private

  def country_params
    params.require(:country).permit(:region, :code)
  end

end
