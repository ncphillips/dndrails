class CampaignsController < ApplicationController
  load_resource
  authorize_resource

  def index
  end

  def new
  end

  def create
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

  def campaign_params
    params.require(:campaign).permit(:title)
  end
end
