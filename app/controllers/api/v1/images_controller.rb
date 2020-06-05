class Api::V1::ImagesController < ApplicationController

  def index
    @images = Image.all
    options = {
      include: [:day]
    }
    hash = ImageSerializer.new(@images, options).serialized_json
    render json: hash
    #render json: EntrySerializer.new(@entries, options)
  end


  def create
    image = Image.new(image_params)
    if image.save
      render json: ImageSerializer.new(image), status: :accepted
    else
      render json: { errors: image.errors.full_message}, status: :unprocessible_entity
    end
  end

    private

    def image_params
      params.require(:image).permit(:url, :caption, :day_id)

    end
end
