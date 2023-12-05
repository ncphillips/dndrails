class StatusEffect < ApplicationRecord
  belongs_to :encounterable, polymorphic: true
end
