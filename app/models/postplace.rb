class Postplace < ActiveRecord::Base
  belongs_to :place
    validates :title, presence:true
    validates :content, presence: true
    validates :place_id, presence: true
end
