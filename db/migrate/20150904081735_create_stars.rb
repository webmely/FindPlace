class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :starcount
      t.string :description

      t.timestamps null: false
    end
  end
end
