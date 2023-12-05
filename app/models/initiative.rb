class Initiative < ApplicationRecord
  belongs_to :encounterable
  belongs_to :encounter
end
