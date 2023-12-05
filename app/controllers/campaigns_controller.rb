class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show]
  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.build(campaign_params)

    if @campaign.save
      flash[:success] = "Campaign was successfully created."
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def show
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:title)
  end
end
