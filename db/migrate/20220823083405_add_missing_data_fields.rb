class AddMissingDataFields < ActiveRecord::Migration[7.0]
  def change
    add_column :caravans, :description, :string
    add_column :users, :profilePic, :string
    add_column :users, :username, :string, null: false
  end
end
