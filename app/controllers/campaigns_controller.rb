class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update]
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

  def edit
  end

  def update
    if @campaign.update(campaign_params)
      flash[:success] = "Campaign was successfully updated."
      redirect_to @campaign
    else
      render :edit
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:title)
  end
end
