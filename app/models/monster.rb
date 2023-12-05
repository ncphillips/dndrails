# == Schema Information
#
# Table name: monsters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Monster < ApplicationRecord
  include Encounterable
end
