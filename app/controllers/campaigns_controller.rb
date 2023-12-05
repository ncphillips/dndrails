class CampaignsController < ApplicationController
  before_action :authenticate_user!
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

  def destroy
    @campaign.destroy
    flash[:success] = "Campaign was successfully deleted."
    redirect_to campaigns_path
  end

  private

  def campaign_params
    params.require(:campaign).permit(:owner_id, :title)
  end
end
