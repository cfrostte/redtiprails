class ApplicationController < ActionController::Base
  
  respond_to :json # Soporte para peticiones JSON (excepto GET y HEAD)
  
  protect_from_forgery with: :exception # Proteccion de solicitudes falsas
  
  # before_action :authenticate_usuario!, except: [:index, :home]
	before_action :authenticate_user_from_token!

  private

  def authenticate_user_from_token!
  
    authenticate_with_http_token do |token, options|
  
      user_email = options[:email].presence
      user = user_email && Usuario.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, token)
        sign_in user, store: false	
      end
  
    end
  
  end

end
