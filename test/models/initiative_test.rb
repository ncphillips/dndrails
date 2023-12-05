# == Schema Information
#
# Table name: initiatives
#
#  id               :integer          not null, primary key
#  score            :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  encounter_id     :integer          not null
#  encounterable_id :integer          not null
#
# Indexes
#
#  index_initiatives_on_encounter_id      (encounter_id)
#  index_initiatives_on_encounterable_id  (encounterable_id)
#
# Foreign Keys
#
#  encounter_id      (encounter_id => encounters.id)
#  encounterable_id  (encounterable_id => encounterables.id)
#
require "test_helper"

class InitiativeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
