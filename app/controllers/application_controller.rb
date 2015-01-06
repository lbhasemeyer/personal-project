class ApplicationController < ActionController::Base

  before_action :require_login

  def current_user
    User.find_by(id: session[:user_id])
  end

  helper_method :current_user
  protect_from_forgery with: :exception

  class AccessDenied < StandardError
  end

  rescue_from AccessDenied, with: :render_404


  private

  def render_404
    render "public/404", status: 404, layout: false
  end

  def require_login
    unless current_user
      redirect_to signin_path
    end
  end

end
