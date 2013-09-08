class UsersController < ApplicationController
  respond_to :json

  def index
    offset = 0 unless params[:offset]
    if params[:query]
      respond_with User.limit(50).offset(offset).where("name like ?", "%#{params[:query]}%"), meta: {total: User.count}
    else
      respond_with User.limit(50).offset(offset).all, meta: {total: User.count}
    end
  end
end
