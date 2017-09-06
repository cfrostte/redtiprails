class Usuarios::SessionsController < Devise::SessionsController
  respond_to :json

    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  # def create
  #   super do |usuario|
  #     if request.format.json?
  #       data = {
  #         token: usuario.authentication_token,
  #         email: usuario.email
  #       }
  #       render json: data, status: 201 and return
  #     end
  #   end
  # end

  # prepend_before_action :require_no_authentication, :only => [:create ]
  # # include Devise::Controllers::InternalHelpers
  
  # before_action :ensure_params_exist

  # respond_to :json
  
  # def create

  #   build_resource
  #   resource = Usuario.find_for_database_authentication(:login=>params[:email][:password])
  #   return invalid_login_attempt unless resource

  #   if resource.valid_password?(params[:email][:password])
  #     sign_in("usuario", resource)
  #     render :json=> {:success=>true, :auth_token=>resource.authentication_token, :login=>resource.login, :email=>resource.email}
  #     return
  #   end
  #   invalid_login_attempt
  # end
  
  # def destroy
  #   sign_out(resource_name)
  # end

  # protected
  # def ensure_params_exist
  #   return unless params[:usuario_login].blank?
  #   render :json=>{:success=>false, :message=>"missing usuario_login parameter"}, :status=>422
  # end

  # def invalid_login_attempt
  #   warden.custom_failure!
  #   render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  # end


  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
