class PlayerInvitesController < ApplicationController
  before_action :authenticate_user!
  load_resource :campaign
  load_resource through: :campaign
  def index
  end
end
