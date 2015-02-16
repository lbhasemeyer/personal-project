class VisitsController < ApplicationController

  def create
    country_code = params[:visit][:country_code]
    country = Country.where(code: country_code.upcase).first
    visit = if current_user.has_visited?(country)
      Visit.where(country_id: country.id, user_id: current_user.id).first
    else
      Visit.create!(country_id: country.id, user_id: current_user.id)
    end
    blog = Blog.new(visit_id: visit.id, site: params[:blog])
    comment = Comment.new(visit_id: visit.id, comment: params[:comment])
    photo = Photo.new(visit_id: visit.id, photo: params[:photo])

    saved = blog.save && comment.save && photo.save

    if saved
      redirect_to private_maps_path, notice: "YAAAY"
    else
      redirect_to private_maps_path, notice: "BOOO"
    end

  end

  def show
    @visit = Visit.find(params[:id])
  end

end
