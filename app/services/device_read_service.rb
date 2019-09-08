class DeviceReadService
  def initialize(device_name, reading_type= Reading.reading_types[:predict])
    @device = Device.find_or_create_by(name: device_name)
    @reading_type = reading_type
    init_mqtt_client
  end

  def read
    begin
      count = 0
      @client.get do |_topic, message|
        return @client.disconnect if count == 100
        Readings::Create.perform_later(message, @device.id, @reading_type)
        count += 1
      end
    rescue
      @client.disconnect
    end
  end

  private

  def init_mqtt_client
    mqtt_client
    @client.subscribe('magnetic_sensor')
  end

  def mqtt_client
    @client ||= Timeout::timeout(5, nil, "⚠️ MQTT could not connected!") do
      MQTT::Client.connect(host: ENV['MQTT_HOST'],
                           port: ENV['MQTT_PORT'],
                           client_id: 'device_reader_api')
    end
  end
end