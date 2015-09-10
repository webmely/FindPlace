class Provice < ActiveRecord::Base
	  validates :name, presence:true

	#config load ajax autocomple provice name
	def self.search(query)
		where("name like ?", "%#{query}%")
	end
end
