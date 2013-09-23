class DictEntriesController < Base::LoggedUserController
  respond_to :json

  # GET /dict_entries
  def index
    #render json: DictEntry.all
    respond_with DictEntry.where(:dictionary_id => params[:dictionary_id])
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
    old_entry = entry.dup
    if entry.update_attributes(params[:dict_entry])
      @activity_logger.log_update_word_ok  data: {old_entry: old_entry, entry: entry}
      render json: nil, status: :ok
    else
      @activity_logger.log_update_word_fail data: {entry: entry}
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
