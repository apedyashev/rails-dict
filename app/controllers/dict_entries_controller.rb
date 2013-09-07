class DictEntriesController < Base::LoggedUserController
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
    new_entry = DictEntry.new params[:dict_entry]
    if new_entry.save
      render json: new_entry
      #@activity_logger.log action: 'add_d_entry_ok', data: {dict_entry_id: new_entry.id}
      @activity_logger.log_add_word_ok data: {dict_entry_id: new_entry.id}
    else
      render json: new_entry, status: 422
      @activity_logger.log_add_word_fail data: {new_entry: new_entry}
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
    @activity_logger.log_delete_word data: {entry: entry}
    entry.destroy
    render json: nil, status: :ok
  end
end
