class WelcomeController < ApplicationController
  #ham index load tat ca dia diem theo danh gia star
  def index
  	@types = Type.all
  	@places = Place.topplace.limit(4).order("star_id DESC")
  end

#ham search auto complete tren view
  def search
  	@search = Place.search(params[:type], params[:proviceid]).order("star_id DESC").page(params[:page]).per(8)
  end
  
#ham search khi nguoi dung click vao xem them dia diem, o trang search
  def searchprovice
  	@result = Place.searchbyprovice(params[:proviceid], params[:typeid]).order("star_id DESC").page(params[:page]).per(8)
  end

end
