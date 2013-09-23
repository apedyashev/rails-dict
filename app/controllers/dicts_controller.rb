class DictsController < Base::LoggedUserController
  respond_to :json

  def index
    if params[:is_public] == 'true'
      render json: Dictionary.where(:is_public => true), root: "dictionaries"
    else
      render json: Dictionary.where(:user_id => session[:user_id]), root: "dictionaries"
    end
  end

  def show
    respond_with Dictionary.find(params[:id])
  end

  def create
    #{"dictionary":{"language1":"dsa","language2":"dsa","is_public":true,"collaboratorIds":[{"user_id":4,"canEdit":false},{"user_id":5,"canEdit":true}],"collaborators":[]}}
    dictionary = params[:dictionary]
    dictionaryToSave = {:language1 => dictionary[:language1], :language2 => dictionary[:language2], :is_public => dictionary[:is_public], :user_id => session[:user_id] }
    newDictionary = Dictionary.new dictionaryToSave
    if newDictionary.save

      collaborators = dictionary[:collaboratorIds]
      if collaborators
        collaborators.each do |coll|
          coll[:dictionary_id]  = newDictionary.id
          newCollaborator       = Collaborators.new coll
          newCollaborator.save
        end
      end

      render json: newDictionary
    else
      render json: newDictionary, status: 422
    end
  end
end
