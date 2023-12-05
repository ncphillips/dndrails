class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show]
  def index
    @campaigns = Campaign.all
  end

  def show
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end
end
