class CreatePredictions < ActiveRecord::Migration[5.2]
  def change
    create_table :predictions do |t|
      t.integer :device_id
      t.string :status
      t.boolean :correct_result
      t.timestamps
    end
  end
end
