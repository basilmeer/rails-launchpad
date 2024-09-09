class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: ::UserSerializer.new(User.all).get_serializable_attrs
  end

end
