class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  validates :fullname, presence:true
  validates :age, numericality: { only_integer: true }
  validates :photo, presence: true
  has_attached_file :photo,
                    :styles => { :thumb => "140x140#", :small => "70x70#"},
                    :default_url => "/images/:style/missing.jpg",
                    :url => "/images/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/users/:id/:style/:basename.:extension"
  
    validates_attachment :photo, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
end
