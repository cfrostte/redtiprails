class Usuario < ApplicationRecord
	devise :database_authenticatable, :registerable, :confirmable, :recoverable

	has_many :canals
	has_many :mensajes
	before_save :ensure_authentication_token

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Usuario.where(authentication_token: token).first
    end
  end
end
