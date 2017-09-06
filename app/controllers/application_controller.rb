class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	before_action :authenticate_usuario!
	respond_to :json
	# before_action :authenticate_usuario!, except: [:index, :home]

	# before_action :authenticate_user_from_token!

  # Enter the normal Devise authentication path,
  # using the token authenticated user if available
  # before_filter :authenticate_usuario!

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
