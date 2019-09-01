class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.float :x_axis
      t.float :y_axis
      t.float :z_axis
      t.float :magnitude
      t.integer :device_id

      t.timestamps
    end
  end
end
