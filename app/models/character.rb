class Character < ApplicationRecord
  include Encounterable
  
  belongs_to :player
end
