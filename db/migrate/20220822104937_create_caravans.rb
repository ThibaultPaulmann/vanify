class CreateCaravans < ActiveRecord::Migration[7.0]
  def change
    create_table :caravans do |t|
      t.references :user, null: false, foreign_key: true
      t.string :model
      t.integer :capacity
      t.string :location
      t.string :fuelType
      t.float :price
      t.integer :year
      t.string :picture_url

      t.timestamps
    end
  end
end
