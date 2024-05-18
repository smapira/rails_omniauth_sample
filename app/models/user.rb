class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.find_or_create_for_oauth(auth)
    find_or_create_by!(email: auth.info.email) do |user|
      user.provider = auth.provider,
        user.uid = auth.uid,
        user.username = auth.info.name,
        user.email = auth.info.email,
        user.password = Devise.friendly_token[0, 20]
    end
  end
end
