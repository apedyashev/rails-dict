class UsersController < Base::LoggedUserController
  respond_to :json

  def index
    offset = 0 unless params[:offset]
    connected_user_ids        = UserConnection.get_connected_user_ids(session[:user_id])
    requested_connection_ids  = UserConnection.get_requested_connection_ids(session[:user_id])
    if params[:query]
      respond_with User.limit(50).offset(offset).where("name like ?", "%#{params[:query]}%"),#.where('id != ?', session[:user_id]),
                   meta: {total: User.count,
                          connected_user_ids: connected_user_ids,
                          requested_connection_ids: requested_connection_ids}
    else
      respond_with User.limit(50).offset(offset).all,#.where('id != ?', session[:user_id]),
                   meta: {total: User.count,
                          connected_user_ids: connected_user_ids,
                          requested_connection_ids: requested_connection_ids}

    end
  end



end
