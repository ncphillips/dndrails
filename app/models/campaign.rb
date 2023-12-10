# == Schema Information
#
# Table name: campaigns
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer          not null
#
# Indexes
#
#  index_campaigns_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  owner_id  (owner_id => users.id)
#
class Campaign < ApplicationRecord
  broadcasts_refreshes

  belongs_to :owner, class_name: "User"
  has_many :encounters, dependent: :destroy
  has_many :players, dependent: :destroy
  has_many :player_invites, dependent: :destroy
  has_many :dungeon_masters, dependent: :destroy

  def to_s
    title
  end
end
