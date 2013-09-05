class DictEntriesController < ApplicationController
  respond_to :json

  # GET /dict_entries
  def index
    #render json: DictEntry.all
    respond_with DictEntry.all
  end

  # GET /dict_entries/:id
  def show
    respond_with DictEntry.find(params[:id])
  end

  # POST /dict_entries
  def create
    activity_logger = ActivityLogger.new

    new_entry = DictEntry.new params[:dict_entry]
    if new_entry.save
      render json: new_entry
      activity_logger.log action: 'add_word_ok'
    else
      render json: new_entry, status: 422
      activity_logger.log action: 'add_word_fail'
    end
  end

  # PUT /dict_entries/1.json
  def update
    entry = DictEntry.find(params[:id])
    if entry.update_attributes(params[:dict_entry])
      render json: nil, status: :ok
    else
      render json: nil, status: :fail
    end

  end

  # DELETE /dict_entries/:id
  def destroy
    entry = DictEntry.find(params[:id])
    entry.destroy
    render json: nil, status: :ok
  end
end
