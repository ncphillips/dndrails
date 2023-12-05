# == Schema Information
#
# Table name: encounters
#
#  id             :integer          not null, primary key
#  description    :text
#  title          :string
#  who_is_up_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  campaign_id    :integer          not null
#  who_is_up_id   :integer
#
# Indexes
#
#  index_encounters_on_campaign_id  (campaign_id)
#  index_encounters_on_who_is_up    (who_is_up_type,who_is_up_id)
#
# Foreign Keys
#
#  campaign_id  (campaign_id => campaigns.id)
#
require "test_helper"

class EncounterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
