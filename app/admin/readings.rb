ActiveAdmin.register Reading do
  filter :reading_type, as: :select, collection: Reading.reading_types
  filter :device_id, as: :select, collection: Device.all
  index do
    column :x_axis
    column :y_axis
    column :z_axis
    column :magnitude
    column :reading_type
    column :created_at
    column :updated_at
  end
end