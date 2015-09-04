class AddProviceToPlaces < ActiveRecord::Migration
  def change
    add_reference :places, :provice, index: true, foreign_key: true
  end
end
