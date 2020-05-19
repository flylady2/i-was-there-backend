class Api::V1::EntriesController < ApplicationController

  def index
    @entries = Entry.all
    options = {
      include: [:category, :day]
    }
    render json: EntrySerializer.new(@entries, options)
  end

  def create
    entry = Entry.new(entry_params)
    if entry.save
      render json: EntrySerializer.new(entry), status: :accepted
    else
      render json: { errors: entry.errors.full_message}, status: :unprocessible_entity
    end
  end

    private

    def entry_params
      params.require(:entry).permit(:content, :category_id)

    end
end
