class Api::V1::EntriesController < ApplicationController

  def index
    @entries = Entry.all
    options = {
      include: [:category, :day]
    }
    hash = EntrySerializer.new(@entries, options).serialized_json
    render json: hash
    #render json: EntrySerializer.new(@entries, options)
  end

  def create
    entry = Entry.new(entry_params)
    if entry.save
      render json: EntrySerializer.new(entry), status: :accepted
    else
      render json: { errors: entry.errors.full_message}, status: :unprocessible_entity
    end
  end

  def update
    @entry = Entry.find(params[:id])
    
    @entry.update(content: params["newContent"])
    render json: EntrySerializer.new(@entry), status: :accepted
  end

    private

    def entry_params
      params.require(:entry).permit(:content, :category_id, :day_id)

    end
end
