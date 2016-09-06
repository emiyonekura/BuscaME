class ApplicationController < ActionController::Base
  before_action :set_cat
  protect_from_forgery with: :exception

  def set_cat
    @cats = Category.all
  end

end
