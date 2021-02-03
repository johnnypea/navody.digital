class UserJourneysController < ApplicationController
  before_action :require_user

  def index
    @user_journeys = current_user.user_journeys.select{ |user_journey| !user_journey.all_steps_completed? }
  end

  def restart
    user_journey = current_user.user_journeys.find(params[:id])

    redirect_to user_journey.restart!.journey
  end
end
