# == Schema Information
#
# Table name: dungeon_masters
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :integer          not null
#
# Indexes
#
#  index_dungeon_masters_on_campaign_id  (campaign_id)
#
# Foreign Keys
#
#  campaign_id  (campaign_id => campaigns.id)
#
class DungeonMaster < ApplicationRecord
  include Encounterable

  belongs_to :campaign
end
