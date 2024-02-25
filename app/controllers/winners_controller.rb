class WinnersController < ApplicationController

  def index
    @winners = Winner.order(distance_to_treasure: params[:sort] || :asc)
    render json: @winners
  end
end
