# == Schema Information
#
# Table name: status_effects
#
#  id                 :integer          not null, primary key
#  encounterable_type :string           not null
#  rounds             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encounterable_id   :integer          not null
#
# Indexes
#
#  index_status_effects_on_encounterable  (encounterable_type,encounterable_id)
#
class StatusEffect < ApplicationRecord
  belongs_to :encounterable, polymorphic: true
end
