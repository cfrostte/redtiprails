class Usuario < ApplicationRecord
	
  devise :database_authenticatable, :registerable, :recoverable #:confirmable

	has_many :canals
	# has_many :mensajes

  has_many :destinatario_mensajes, :class_name => 'Mensaje', :foreign_key => 'destinatario_id'
  has_many :remitente_mensajes, :class_name => 'Mensaje', :foreign_key => 'remitente_id'
  # has_many :destinatario_mensajes, :class_name => 'Mensajes', :foreign_key => 'destinatario_id'
  # has_many :remitente_mensajes, :class_name => 'Mensajes', :foreign_key => 'remitente_id'

	
  validates_uniqueness_of :email
  validates_uniqueness_of :nickname

  before_save :ensure_authentication_token
  
  # before_validation :parse_image
  # attr_accessor :image_base 

  # has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png" 
  # validates_attachment :picture, presence: true 
  # do_not_validate_attachment_file_type :picture

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

  # def parse_image 
  #   image = Paperclip.io_adapters.for(image_base) 
  #   image.original_filename = "file.jpg" 
  #   self.picture = image
  # end

end
