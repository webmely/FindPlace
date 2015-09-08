class WelcomeController < ApplicationController
  def index
  	@types = Type.all
  end

  def search
  	@search = Place.search(params[:type], params[:proviceid])
  	
  end
end
