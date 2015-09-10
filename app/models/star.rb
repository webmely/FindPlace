class Star < ActiveRecord::Base
	validates :starcount , presence:true , numericality: true
end
