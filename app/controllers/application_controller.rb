class ApplicationController < ActionController::Base
  before_action :set_guest_code

  def set_guest_code
    session[:guest_code] = params[:guest_code] if params[:guest_code].present?

    session[:guest_code] ||= SecureRandom.uuid
  end

  def guest_code
    session[:guest_code]
  end

  helper_method :guest_code
end
