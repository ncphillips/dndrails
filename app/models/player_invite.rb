# == Schema Information
#
# Table name: player_invites
#
#  id            :integer          not null, primary key
#  email         :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  campaign_id   :integer          not null
#  invited_by_id :integer          not null
#
# Indexes
#
#  index_player_invites_on_campaign_id    (campaign_id)
#  index_player_invites_on_invited_by_id  (invited_by_id)
#
# Foreign Keys
#
#  campaign_id    (campaign_id => campaigns.id)
#  invited_by_id  (invited_by_id => users.id)
#
class PlayerInvite < ApplicationRecord
  belongs_to :campaign
  belongs_to :invited_by, class_name: "User"

  after_create_commit :send_email

  enum status: { not_sent: "not_sent", sent: "sent", cancelled: "cancelled", rejected: "rejected", accepted: "accepted" }

  def to_s
    email
  end

  def send_email
    PlayerMailer.with(player_invite: self).youre_invited.deliver
  end
end
