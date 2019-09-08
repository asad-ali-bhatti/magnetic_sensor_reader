module Readings
  class Create < ApplicationJob
    queue_as :default

    def perform(reading_data, device_id, reading_type)
      reading = eval reading_data
      device = Device.find(device_id)
      device.readings.create(x_axis: reading[:x],
                             y_axis: reading[:y],
                             z_axis: reading[:z],
                             reading_type: reading_type)
    end
  end
end