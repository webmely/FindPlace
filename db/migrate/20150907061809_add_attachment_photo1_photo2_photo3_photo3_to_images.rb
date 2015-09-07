class AddAttachmentPhoto1Photo2Photo3Photo3ToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :photo1
      t.attachment :photo2
      t.attachment :photo3
      t.attachment :photo4
    end
  end

  def self.down
    remove_attachment :images, :photo1
    remove_attachment :images, :photo2
    remove_attachment :images, :photo3
    remove_attachment :images, :photo4
  end
end
