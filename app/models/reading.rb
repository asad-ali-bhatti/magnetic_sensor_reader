# == Schema Information
#
# Table name: readings
#
#  id         :bigint           not null, primary key
#  x_axis     :float
#  y_axis     :float
#  z_axis     :float
#  magnitude  :float
#  device_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reading < ApplicationRecord
end
