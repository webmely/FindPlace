class WelcomeController < ApplicationController
  def index
  	@types = Type.all
  end
  def show
  end

  def search
  	@search = Place.search(params[:type], params[:proviceid]).page(params[:page]).per(8)
  end

end
