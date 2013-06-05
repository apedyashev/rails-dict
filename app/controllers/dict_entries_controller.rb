class DictEntriesController < ApplicationController
  respond_to :json

  def index
    #render json: DictEntry.all
    respond_with DictEntry.all
  end

  def show
    respond_with DictEntry.find(params[:id])
  end

  def create
    new_entry = DictEntry.new params[:dict_entry]
    if new_entry.save
      render json: new_entry
    else
      render json: new_entry, status: 422
    end
  end
end
