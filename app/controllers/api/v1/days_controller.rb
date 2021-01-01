class Api::V1::DaysController < ApplicationController

  before_action :authorized

  def index
    days = Day.all.select { |day| day.user_id == current_user.id }
    #byebug
    if params[:date]
      @day = days.search_by_date(params[:date])
    else
      @day = days.last
    end


    options = {
      include: [:entries, :image]
    }

    render json: DaySerializer.new(@day, options)


  end

  def create

    @day = Day.new(day_params, user_id: current_user.id)

    if @day.save

      @entries = @day.entries.build([{content: params["entry_content_1"], category_id: params["category_id_1"]}, {content: params["entry_content_2"], category_id: params["category_id_2"]}, {content: params["entry_content_3"], category_id: params["category_id_3"]}, {content: params["entry_content_4"], category_id: params["category_id_4"]}, {content: params["entry_content_5"], category_id: params["category_id_5"]}, {content: params["entry_content_6"], category_id: params["category_id_6"]}])

      @entries.each {|entry|
      entry.save}

      @image = @day.build_image(url: params["input_url"], caption: params["input_caption"])
      @image.save

      options = {
        include: [:entries, :image]
      }
      render json: DaySerializer.new(@day, options), status: :accepted
    else

      render json: { errors: @day.errors.full_messages}, status: :unprocessable_entity

    end

  end

  def destroy
    @day = Day.find(params[:id])
    @day.destroy
  end



    private

    def day_params
      params.require(:day).permit(:name, :date, :user_id, entries_attributes: [:content, :day_id, :category_id], image_attributes: [:url, :caption, :day_id])

    end
end
