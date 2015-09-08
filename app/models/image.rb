class Image < ActiveRecord::Base
	belongs_to :place

	has_attached_file :photo,
                    :styles => { :thumb => "140x140#", :small => "70x70#", :medium =>"400x400#"},
                    :default_url => "/images/:style/missing.png",
                    :url => "/images/img/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/img/:id/:style/:basename.:extension"
  
    validates_attachment :photo, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
end
