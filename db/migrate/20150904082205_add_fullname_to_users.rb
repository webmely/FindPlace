class AddFullnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :address, :string
    add_column :users, :age, :integer
  end
end
