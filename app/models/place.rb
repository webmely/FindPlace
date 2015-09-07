class Place < ActiveRecord::Base
  belongs_to :star
  belongs_to :type
  has_many :image

end
