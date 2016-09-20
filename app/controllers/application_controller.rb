class ApplicationController < ActionController::Base
  before_action :set_cat 
  protect_from_forgery with: :exception

  def set_cat
    @cats = Category.all
  end


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to products_path, alert: "No tienes acceso a esta página"
  end

end
