class PrivateMapsController < ApplicationController

  ## what countries have they visited and what are those ids?

  def create
    @countries = Country.all
    @visits = Visit.all

    puts "XXXXXXX>X>X>X>X>X>X>..X.x.x"
    puts params
    render json: params

    visited_countries = []
    params[:countries].each do |clicked_country|
      @countries.each do |country|
        if clicked_country.upcase == country.code
          visited_countries << country.id
        end
      end
    end
    puts visited_countries

    visited_countries.each do |visited_country|
      next if current_user.has_visited?(visited_country)
        Visit.create!(user_id: current_user.id, country_id: visited_country)
    end
  end

end
