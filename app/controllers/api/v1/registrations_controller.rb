class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  before_action :configure_permitted_params, only: :create

  private

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name dob gender])
  end

end
