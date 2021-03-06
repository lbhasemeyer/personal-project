class PrivateMapsController < ApplicationController

  ## what countries have they visited and what are those ids?
  def index
    @visit = Visit.new
  end

  def create
    @countries = Country.all
    @visits = Visit.all

    visited_countries = []
    params[:countries].each do |clicked_country|
      @countries.each do |country|
        if clicked_country.upcase == country.code
          visited_countries << country.id
        end
      end
    end

    visited_countries.each do |visited_country|
      next if current_user.has_visited?(visited_country)
      Visit.create!(user_id: current_user.id, country_id: visited_country)
    end

    current_user.visits.each do |visit|
      if !params[:countries].include?(visit.country.code.downcase)
        visit.destroy!
      end
    end

    # return json for the javascript ajax calls
    render json: params
    # render js: "window.location.pathname='#{jobs_path}'"
    # format.json { render :json => {:result => 'success',  :redirect => root_path } }
  end

  def clicked
    render json: current_user.visited_country_codes
  end

end
