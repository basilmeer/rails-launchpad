class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: UserSerializer.new(resource).serializable_hash[:data][:attributes], status: :ok
    else
      json_error(errors: resource.errors)
    end
  end

  def respond_to_on_destroy
    head :no_content
  end

end
