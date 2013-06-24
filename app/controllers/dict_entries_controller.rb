class DictEntriesController < ApplicationController
  respond_to :json

  # GET dict_entries
  def index
    #render json: DictEntry.all
    respond_with DictEntry.all
  end

  # GET dict_entries/:id
  def show
    respond_with DictEntry.find(params[:id])
  end

  # POST
  def create
    new_entry = DictEntry.new params[:dict_entry]
    if new_entry.save
      render json: new_entry
    else
      render json: new_entry, status: 422
    end
  end

  # DELETE
  def destroy
    entry = DictEntry.find(params[:id])
    entry.destroy
    render json: nil, status: :ok
  end
end
