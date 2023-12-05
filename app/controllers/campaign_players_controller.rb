class CampaignPlayersController < ApplicationController
  before_action :load_campaign

  def index
    @players = @campaign.players
  end

  private

  def load_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
