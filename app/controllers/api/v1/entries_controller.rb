class Api::V1::EntriesController < ApplicationController



  def update
    @entry = Entry.find(params[:id])

    @entry.update(content: params["newContent"])
    #byebug
    render json: EntrySerializer.new(@entry), status: :accepted
  end

    private

    def entry_params
      params.require(:entry).permit(:content, :category_id, :day_id)

    end
end
