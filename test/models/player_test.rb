# == Schema Information
#
# Table name: players
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_players_on_campaign_id  (campaign_id)
#  index_players_on_user_id      (user_id)
#
# Foreign Keys
#
#  campaign_id  (campaign_id => campaigns.id)
#  user_id      (user_id => users.id)
#
require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
