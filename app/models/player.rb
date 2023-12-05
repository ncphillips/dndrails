# == Schema Information
#
# Table name: players
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :integer          not null
#
# Indexes
#
#  index_players_on_campaign_id  (campaign_id)
#
# Foreign Keys
#
#  campaign_id  (campaign_id => campaigns.id)
#
class Player < ApplicationRecord
  belongs_to :campaign
end