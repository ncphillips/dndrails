# == Schema Information
#
# Table name: campaigns
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Campaign < ApplicationRecord
  def to_s
    title
  end
end
