class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  before_action :configure_permitted_params, only: :create

  def create
    build_resource(sign_up_params)

    if resource.save
      render json: resource.generate_jwt
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  private

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name dob gender])
  end

end
