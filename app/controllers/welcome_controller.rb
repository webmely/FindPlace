class WelcomeController < ApplicationController
  def index
  	@types = Type.all
  	@places = Place.topplace.limit(4).order("star_id DESC")
  end
  def search
  	@search = Place.search(params[:type], params[:proviceid]).order("star_id DESC").page(params[:page]).per(8)
  end

end
