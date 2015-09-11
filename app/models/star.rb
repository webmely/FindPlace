class Star < ActiveRecord::Base
	#validate field khong duoc de trong , va chi duoc nhap vao kieu so
	validates :starcount , presence:true , numericality: true 
end
