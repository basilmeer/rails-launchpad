class Api::V1::PasswordsController < Devise::SessionsController
  respond_to :json
end
