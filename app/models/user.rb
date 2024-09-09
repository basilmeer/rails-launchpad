# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  dob                    :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  gender                 :integer          default("male"), not null
#  jti                    :string           not null
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_jti                   (jti) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
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
