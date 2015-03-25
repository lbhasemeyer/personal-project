class PublicMapsController < ApplicationController

  def get_things
    country = Country.where(code: params[:code].upcase).first
    render json: { photos: country.photos, blogs: country.blogs, comments: country.comments }
  end

end
