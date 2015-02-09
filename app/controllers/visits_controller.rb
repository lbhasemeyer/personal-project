class VisitsController < ApplicationController

  def create
    country_code = params[:visit][:country_code]
    country = Country.where(code: country_code.upcase).first
    if current_user.has_visited?(country)
      visit = Visit.where(country_id: country.id, user_id: current_user.id).first
      blog = Blog.new(visit_id: visit.id, site: params[:blog])
      blog.save
    else
      visit = Visit.new(country_id: country.id, user_id: current_user.id)
      if visit.save
        blog = Blog.new(visit_id: visit.id, site: params[:blog])
        blog.save
      end
    end
  end

end
