class Image < ActiveRecord::Base
	belongs_to :place
	validates :photo, presence:true #validate photo khong duoc de trong

	#chi dinh noi luu anh va cat anh
	has_attached_file :photo,
                    :styles => { :thumb => "140x140#", :small => "70x70#", :medium =>"400x400#"},
                    :default_url => "/images/:style/missing.png",
                    :url => "/images/img/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/img/:id/:style/:basename.:extension"
     #Kiem tra file upload co phai la image hay khong
    validates_attachment :photo, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
end
