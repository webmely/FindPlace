class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :typename
      t.string :description

      t.timestamps null: false
    end
  end
end
