class User < ApplicationRecord

  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  ## Enums
  enum :gender, %i[male female]

  def generate_jwt
    JWT.encode({ id: id, exp: ENV['DEVISE_JWT_TOKEN_EXPIRY_IN_DAYS'].to_i.days.to_i }, ENV['DEVISE_JWT_SECRET_KEY'])
  end

end
