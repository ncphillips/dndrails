class PlayerInvitesController < ApplicationController
  load_resource :campaign
  load_resource through: :campaign
  def index
  end
end
