class Place < ActiveRecord::Base
  belongs_to :star
  belongs_to :type
  has_many :image

  #validate data
  validates :name, presence: true
validates :address, presence: true
validates :description, presence: true
validates :type_id, presence: true
validates :star_id, presence: true
validates :provice_id, presence: true
validates :avatar, presence: true
  #end

  has_attached_file :avatar,
                    :styles => { :thumb => "140x140#", :small => "70x70#", :medium =>"200x200#"},
                    :default_url => "/images/:style/missing.png",
                    :url => "/images/places/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/places/:id/:style/:basename.:extension"
  
    validates_attachment :avatar, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}

    #function search provice and type
    #Ham tim kiem auto comple tren view index
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
    #ham hien thi dia diem danh gia cao tren trang index
    def self.topplace
        where("star_id >= 3")
    end

    #function search by provice
    #Ham tim kiem theo tinh thanh va the loai cua dia diem
    def self.searchbyprovice(provice_id, type_id)
      where("provice_id = #{provice_id} AND type_id = #{type_id}")
    end
end
