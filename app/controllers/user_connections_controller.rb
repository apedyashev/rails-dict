class UserConnectionsController < Base::LoggedUserController
  respond_to :json

  def index
    if  params[:connected_user_id]
      respond_with UserConnection.where(connected_user_id: params[:connected_user_id]).where(user_id: session[:user_id])
    else
      respond_with UserConnection.all
    end
  end

  def show

  end

  def create
    connection_data = params[:user_connection]
    connection_data[:user_id] = session[:user_id]

    new_connection = UserConnection.new connection_data
    if new_connection.save
      render json: new_connection
      @activity_logger.log_add_connection data: {new_connection: new_connection}
    else
      render json: nill, status: 422
      @activity_logger.log_add_connection data: {connection_data: connection_data}
    end
  end


  def destroy
    entry = UserConnection.find(params[:id])
    @activity_logger.log_delete_connection data: {entry: entry}
    entry.destroy
    render json: nil, status: :ok
  end
end
