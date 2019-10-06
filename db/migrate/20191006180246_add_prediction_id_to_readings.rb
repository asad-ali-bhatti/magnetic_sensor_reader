class AddPredictionIdToReadings < ActiveRecord::Migration[5.2]
  def change
    add_column :readings, :prediction_id, :integer
  end
end
