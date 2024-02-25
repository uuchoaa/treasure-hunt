class GuessesController < ApplicationController

  def create
    user = User.find_or_create_by(email: guess_params[:email])
    winner = Winner.new(user: user, latitude: guess_params[:latitude], longitude: guess_params[:longitude])

    if winner.save
      render json: { message: "Congratulations, you've found the treasure!" }, status: :ok
    else
      render json: { message: "Keep trying!" }, status: :unprocessable_entity
    end
  end

  private

  def guess_params
    params.require(:guess).permit(:email, :latitude, :longitude)
  end
end
