# == Schema Information
#
# Table name: devices
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Device < ApplicationRecord
end
