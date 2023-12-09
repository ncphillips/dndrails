# == Schema Information
#
# Table name: player_invites
#
#  id            :integer          not null, primary key
#  email         :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  campaign_id   :integer          not null
#  invited_by_id :integer          not null
#
# Indexes
#
#  index_player_invites_on_campaign_id    (campaign_id)
#  index_player_invites_on_invited_by_id  (invited_by_id)
#
# Foreign Keys
#
#  campaign_id    (campaign_id => campaigns.id)
#  invited_by_id  (invited_by_id => users.id)
#
require "test_helper"

class PlayerInviteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
