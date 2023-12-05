# == Schema Information
#
# Table name: dungeon_masters
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_dungeon_masters_on_campaign_id  (campaign_id)
#  index_dungeon_masters_on_user_id      (user_id)
#
# Foreign Keys
#
#  campaign_id  (campaign_id => campaigns.id)
#  user_id      (user_id => users.id)
#
class DungeonMaster < ApplicationRecord
  include Encounterable

  belongs_to :user
  belongs_to :campaign
end
