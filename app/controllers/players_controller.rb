class PlayersController < ApplicationController
  load_and_authorize_resource :campaign
  load_and_authorize_resource

  def index
  end
end
