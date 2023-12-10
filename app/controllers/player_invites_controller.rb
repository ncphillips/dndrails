class PlayerInvitesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :campaign
  load_and_authorize_resource through: :campaign
  def index
  end

  def new
  end

  def create
    @player_invite.invited_by = current_user

    if @player_invite.save
      redirect_to campaign_player_invites_path(@campaign), notice: "Invite sent to #{@player_invite.email}"
    else
      render :new
    end
  end

  private

  def player_invite_params
    params.require(:player_invite)
      .permit(:email)
  end
end
