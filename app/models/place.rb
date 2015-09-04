class Place < ActiveRecord::Base
  belongs_to :star
  belongs_to :image
  belongs_to :type
end
