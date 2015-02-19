class VisitsController < ApplicationController

  def create
    country_code = params[:visit][:country_code]
    country = Country.where(code: country_code.upcase).first
    visit = if current_user.has_visited?(country)
      Visit.where(country_id: country.id, user_id: current_user.id).first
    else
      Visit.create!(country_id: country.id, user_id: current_user.id)
    end

    if saved
      redirect_to private_maps_path, notice: "Country Info Was Successfully Saved"
    else
      redirect_to private_maps_path, notice: "Oops, There Was a Problem.  Please Try Again."
    end
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def update
    @visit = Visit.find(params[:id])
    blog = Blog.new(visit_id: @visit.id, site: params[:blog])
    comment = Comment.new(visit_id: @visit.id, comment: params[:comment])
    photo = Photo.new(visit_id: @visit.id, photo: params[:photo])
    if blog.save && comment.save && photo.save
      redirect_to visit_path(@visit)
    else
      redirect_to root_path
    end
  end


end
