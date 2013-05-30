class DictEntriesController < ApplicationController
  respond_to :json

  def index
    #render json: DictEntry.all
    respond_with DictEntry.all
  end

  def show
    respond_with DictEntry.find(params[:id])
  end
end
