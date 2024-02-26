class WinnersController < ApplicationController

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 5
    sort_order = params[:sort_order] || :asc

    @winners = Winner.paginate(page:, per_page:).order(distance_to_treasure: sort_order)
  end
end
