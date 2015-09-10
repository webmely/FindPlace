class Place < ActiveRecord::Base
  belongs_to :star
  belongs_to :type
  has_many :image

  has_attached_file :avatar,
                    :styles => { :thumb => "140x140#", :small => "70x70#", :medium =>"200x200#"},
                    :default_url => "/images/:style/missing.png",
                    :url => "/images/places/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/places/:id/:style/:basename.:extension"
  
    validates_attachment :avatar, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}

    #function search provice and type
    def self.search(type_id, provice_id)
		if type_id == "all"
			where("provice_id = #{provice_id}")
		elsif type_id == 1
			where("type_id = #{type_id} AND provice_id = #{provice_id}")
		elsif type_id == 2
			where("type_id = #{type_id} AND provice_id = #{provice_id}")
		else
			where("type_id = #{type_id} AND provice_id = #{provice_id}")
		end
    end

    #function load top place
    def self.topplace
        where("star_id >= 3")
    end
end
