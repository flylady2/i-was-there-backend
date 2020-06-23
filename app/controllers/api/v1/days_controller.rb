class Api::V1::DaysController < ApplicationController

#will have to change to searched for days, or maybe the day before?


  def index
    days = []
    #byebug
    if params[:date]
      last_day = Day.search_by_date(params[:date])
    else
      last_day = Day.all.last
    end
    days = days.push(last_day)
    options = {
      include: [:entries, :image]
    }
    render json: DaySerializer.new(days, options)

  end

  def create
    #byebug
    @day = Day.new(day_params)
    #byebug
    @day.save

    @entries = @day.entries.build([{content: params["entry_content_1"], category_id: params["category_id_1"]}, {content: params["entry_content_2"], category_id: params["category_id_2"]}, {content: params["entry_content_3"], category_id: params["category_id_3"]}, {content: params["entry_content_4"], category_id: params["category_id_4"]}])

    @entries.each {|entry|
      entry.save}

    @image = @day.build_image(url: params["input_url"], caption: params["input_caption"])
    @image.save

    options = {
      include: [:entries, :image]
    }
    #byebug
    if @day.save
      render json: DaySerializer.new(@day, options), status: :accepted
    else
      #byebug
      render json: { errors: @day.errors.full_messages}, status: :unprocessable_entity
    end
    #end
  end

  def destroy
    @day = Day.find(params[:id])
    @day.destroy
  end


    private

    def day_params
      params.require(:day).permit(:name, :date, entries_attributes: [:content, :day_id, :category_id], image_attributes: [:url, :caption, :day_id])

    end
end
