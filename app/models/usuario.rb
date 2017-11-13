class Usuario < ApplicationRecord
	
  devise :database_authenticatable, :registerable, :confirmable, :recoverable

	has_many :canals
	# has_many :mensajes

  has_many :destinatario_mensajes, :class_name => 'Mensajes', :foreign_key => 'destinatario_id'
  has_many :remitente_mensajes, :class_name => 'Mensajes', :foreign_key => 'remitente_id'

	
  validates_uniqueness_of :email
  validates_uniqueness_of :nickname

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
