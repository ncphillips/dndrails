class PlayerInvitesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :campaign
  load_and_authorize_resource through: :campaign
  def index
  end
end
