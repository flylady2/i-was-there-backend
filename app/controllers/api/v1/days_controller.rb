class Api::V1::DaysController < ApplicationController

  #will have to change to searched for days, or maybe the day before?
  def index
    days = Day.all

    render json: DaySerializer.new(days)
  end

  def create
    day = Day.new(day_params)
    if entry.day
      render json: DaySerializer.new(day), status: :accepted
    else
      render json: { errors: day.errors.full_message}, status: :unprocessible_entity
    end
  end

    private

    def day_params
      params.require(:day).permit(:name, :date)

    end
end
