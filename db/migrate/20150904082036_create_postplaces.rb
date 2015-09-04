class CreatePostplaces < ActiveRecord::Migration
  def change
    create_table :postplaces do |t|
      t.string :title
      t.text :content
      t.references :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
