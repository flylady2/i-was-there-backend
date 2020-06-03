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

    @entries = @day.entries.build([{content: params["entry_content_1"], category_id: params["category_id_1"]}, {content: params["entry_content_2"], category_id: params["category_id_2"]}, {content: params["entry_content_3"], category_id: params["category_id_3"]}, {content: params["entry_content_4"], category_id: params["category_id_4"]}])

    @entries.each {|entry|
      entry.save}
    options = {
      include: [:entries]
    }
    #byebug
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
