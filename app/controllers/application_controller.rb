class ApplicationController < ActionController::API

  def authenticate_user!
    head :unauthorized unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

  def current_user
    jwt_payload = JWT.decode(
      request.headers['Authorization'].split(' ')[1],
      ENV['DEVISE_JWT_SECRET_KEY']
    ).first
    @current_user_id = jwt_payload['sub']
    @current_user ||= User.find_by(id: @current_user_id, jti: jwt_payload['jti'])
  end

  def json_error(errors:, status: :unprocessable_entity)
    render json: { errors: errors.full_messages.to_sentence }, status: status
  end

end
