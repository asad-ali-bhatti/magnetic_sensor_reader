class AddTestDataColumnToReadings < ActiveRecord::Migration[5.2]
  def change
    add_column :readings, :reading_type, :string
  end
end
