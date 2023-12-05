module Encounterable
  extend ActiveSupport::Concern

  included do
    has_many :initiatives
  end
end