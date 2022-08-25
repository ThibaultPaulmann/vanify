class AddCoordinatesToCaravans < ActiveRecord::Migration[7.0]
  def change
    add_column :caravans, :latitude, :float
    add_column :caravans, :longitude, :float
  end
end
