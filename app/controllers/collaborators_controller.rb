class CollaboratorsController < Base::LoggedUserController
  respond_to :json

  def index
    respond_with Collaborators.where(:dictionary_id => params[:dictionary_id])
  end

  def show
  end

  def create

  end
end
