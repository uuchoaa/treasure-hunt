class WinnersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @winners = Winner.order(distance_to_treasure: params[:sort] || :asc)
    render json: @winners
  end
end
