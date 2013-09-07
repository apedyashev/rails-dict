class UserConnectionsController < ApplicationController
  respond_to :json

  def index
    respond_with UserConnection.all
  end
end
