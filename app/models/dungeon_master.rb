class DungeonMaster < ApplicationRecord
  include Encounterable

  belongs_to :campaign
end
