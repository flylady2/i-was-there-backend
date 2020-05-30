class Api::V1::DaysController < ApplicationController

  #will have to change to searched for days, or maybe the day before?
  def index
    days = []
    last_day = Day.all.last
    days = days.push(last_day)

    #render json: DaySerializer.new(days)
    options = {
      include: [:entries]
    }
    render json: DaySerializer.new(days, options)
    #options = {include: [:entries]}
    #hash = DaySerializer.new(days, options).serialized_json
    #render json: hash
  end

  def create
    #byebug
    @day = Day.new(day_params)
    #byebug
    @day.save
    #byebug
    @entry = @day.entries.build(content: params["entry_content"], category_id: params["category_id"])
    @entry.save
    #byebug
    options = {
      include: [:entries]
    }

    render json: DaySerializer.new(@day, options), status: :accepted
    #else
      #render json: { errors: day.errors.full_message}, status: :unprocessible_entity
    #end
  end

    private

    def day_params
      params.require(:day).permit(:name, :date, entries_attributes: [:content, :day_id, :category_id])

    end
end
