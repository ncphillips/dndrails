class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @invitations = PlayerInvite.where(email: current_user.email).order(created_at: :desc)
  end
end
