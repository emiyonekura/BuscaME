class PagesController < ApplicationController
  def index
  end

  def set_address
  	@address = Geocoder.address([params[:lat], params[:lon]])
  end
end
