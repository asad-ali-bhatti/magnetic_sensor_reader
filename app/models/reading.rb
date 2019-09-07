# == Schema Information
#
# Table name: readings
#
#  id           :bigint           not null, primary key
#  x_axis       :float
#  y_axis       :float
#  z_axis       :float
#  magnitude    :float
#  device_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  reading_type :string
#

class Reading < ApplicationRecord
  belongs_to :device
  before_save :calculate_magnitude

  scope :max_magnitude, -> { maximum :magnitude }

  enum reading_type: {test: 'test', training: 'training', predict: 'predict'}

  private

  def calculate_magnitude
    # Square root of (x)^2 + (y)^2 + (z)^2
    self.magnitude = Math.sqrt(x_axis**2 + y_axis**2 + z_axis**2)
  end
end
