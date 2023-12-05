# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  player_id  :integer
#
# Indexes
#
#  index_characters_on_player_id  (player_id)
#
# Foreign Keys
#
#  player_id  (player_id => players.id)
#
require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
