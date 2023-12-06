class CampaignPlayersController < ApplicationController
  load_and_authorize_resource :campaign

  def index
    @players = @campaign.players
  end
end
