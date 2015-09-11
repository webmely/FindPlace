class Provice < ActiveRecord::Base
	  validates :name, presence:true

	#config load ajax autocomple provice name
	#Ham search su dung cho ajax auto complete tren view index
	def self.search(query)
		where("name like ?", "%#{query}%")
	end
end
