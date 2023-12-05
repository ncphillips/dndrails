class Encounter < ApplicationRecord
  belongs_to :campaign
  belongs_to :who_is_up, polymorphic: true
end
