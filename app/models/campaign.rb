# == Schema Information
#
# Table name: campaigns
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Campaign < ApplicationRecord
  has_many :encounters, dependent: :destroy
  has_many :players, dependent: :destroy
  has_many :dungeon_masters, dependent: :destroy

  def to_s
    title
  end
end
