class Usuarios::SessionsController < Devise::SessionsController
  prepend_before_action :require_no_authentication, only: [:new, :create]
  before_action :configure_sign_in_params, only: [:create]
  # before_action :ensure_params_exist
  prepend_before_action :verify_signed_out_user, only: :destroy

  respond_to :json

  # def create
  #   # build_resource
  #   resource = Usuario.find_for_database_authentication(params[:email][:password])
  #   #resource = Usuario.where(params[:email]).where(params[:password]).first
  #    return invalid_login_attempt unless resource

  #   if resource.valid_password?(params[:email][:password])
  #     sign_in("usuario", resource)
  #     render :json=> {:success=>true, :auth_token=>resource.authentication_token, :login=>resource.login, :email=>resource.email}
  #   else
  #     invalid_login_attempt
  #   end
  # end

def new
    p "---------------------------------------"
    p params.inspect
    p "---------------------------------------"
    # resource = Usuario.find_for_database_authentication(:email => params[:user_login][:email])
    resource = Usuario.find_for_database_authentication(:email => params[:email])
    return invalid_login_attempt unless resource

    # if resource.valid_password?(params[:user_login][:password])
    if resource.valid_password?(params[:password])
      # p "----------------------mostrando confirmer------------------"
      # p resource.confirmed_at.blank?
      # p "----------------------mostrando confirmer------------------"
      if resource.confirmed_at != nil
        # ensure_confirmed_account(resource)
        sign_in(:user, resource)
        session[:hashAuth] = Devise.friendly_token
        p "-------------------SIGN_IN-------------"
        p sign_in(:user, resource)
        p "-----------------------------------------"
        p "---------------SESSION [HASh-AUHT]--------------------------"
        p session[:hashAuth]
        p "-----------------------------------------"
        p "--------------SESSION solo--------------------------"
        p session
        p "----------------------------------------"
        #resource.ensure_authentication_token
        # render :json=> {:success=>true, :authentication_token=>session[:hashAuth], :email=>resource.email}
        render :json=> {:success=>true, :authentication_token=>resource.authentication_token, :email=>resource.email}
        return
      else
        render :json=> {:success=>false, :message=>"Debe confirmar su cuenta antes de iniciar sesion, por favor chequee su correo"}, :status=>400
        return
      end
        
    end
    invalid_login_attempt
  end


  def create
    resource = Usuario.find_for_database_authentication(:email => params[:user_login][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user_login][:password])
      # p "----------------------mostrando confirmer------------------"
      # p resource.confirmed_at.blank?
      # p "----------------------mostrando confirmer------------------"
      if resource.confirmed_at != nil
        # ensure_confirmed_account(resource)
        sign_in(:user, resource)
        session[:hashAuth] = Devise.friendly_token
        p "-------------------SIGN_IN-------------"
        p sign_in(:user, resource)
        p "-----------------------------------------"
        p "---------------SESSION [HASh-AUHT]--------------------------"
        p session[:hashAuth]
        p "-----------------------------------------"
        p "--------------SESSION solo--------------------------"
        p session
        p "----------------------------------------"
        #resource.ensure_authentication_token
        # render :json=> {:success=>true, :authentication_token=>session[:hashAuth], :email=>resource.email}
        render :json=> {:success=>true, :authentication_token=>resource.authentication_token, :email=>resource.email}
        return
      else
        render :json=> {:success=>false, :message=>"Debe confirmar su cuenta antes de iniciar sesion, por favor chequee su correo"}, :status=>400
        return
      end
        
    end
    invalid_login_attempt
  end

  # render :json => {:success => false, :message => "Error with your login or password"}, :status => 401
  
  ############################################################################## 

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

  # include Devise::Controllers::InternalHelpers
  


# def new
#     self.resource = resource_class.new(sign_in_params)
#     clean_up_passwords(resource)
#     yield resource if block_given?
#     respond_with(resource, serialize_options(resource))
#   end

#   # POST /resource/sign_in
#   def create
#     self.resource = warden.authenticate!(auth_options)
#     set_flash_message!(:notice, :signed_in)
#     sign_in(resource_name, resource)
#     yield resource if block_given?
#     respond_with resource, location: after_sign_in_path_for(resource)
#   end
# def sign_in_params
#     devise_parameter_sanitizer.sanitize(:sign_in)
#   end
#   def serialize_options(resource)
#     methods = resource_class.authentication_keys.dup
#     methods = methods.keys if methods.is_a?(Hash)
#     methods << :password if resource.respond_to?(:password)
#     { methods: methods, only: [:password] }
#   end
  
  def destroy
    p "-------------------SIGN_IN-------------"
    p sign_in(:user, resource)
    p "-----------------------------------------"
    p "---------------SESSION [HASh-AUHT]--------------------------"
    p session[:hashAuth]
    p "-----------------------------------------"
    p "--------------SESSION solo--------------------------"
    p session
    p "----------------------------------------"

    sign_out(resource_name)
    respond_to_on_destroy
    
    p "-------------------SIGN_IN-------------"
    p sign_in(:user, resource)
    p "-----------------------------------------"
    p "---------------SESSION [HASh-AUHT]--------------------------"
    p session[:hashAuth]
    p "-----------------------------------------"
    p "--------------SESSION solo--------------------------"
    p session
    p "----------------------------------------"
  end

  protected
  def ensure_params_exist
    p "---------------------------------------"
    p params[:user_login]
    return unless params[:user_login].blank?
    render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  end

  def invalid_login_attempt
    # warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end

  # def ensure_confirmed_account(resource)
  #   return unless resource.confirmed_at.blank?
  #   render :json=> {:success=>false, :message=>"Debe confirmar su cuenta antes de iniciar sesion, por favor chequee su correo"}, :status=>400
  #   # return
  # end


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

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  private

  def verify_signed_out_user
    
    p "-----------PARAMS --------------"
    p params
    p "-------------SESSION------------"
    p session
    p "-------------DESVIS.MAPPING------------"
    p Devise.mappings.keys.map
    p "-------------------------"
    # if all_signed_out?
    #   set_flash_message! :notice, :already_signed_out

    #   render :json=> {:success=>false, :message=>"Mensaje del on destroy"}, :status=>400
    # end
  end

  def all_signed_out?
    users = Devise.mappings.keys.map { |s| warden.user(scope: s, run_callbacks: false) }

    users.all?(&:blank?)
  end

  def respond_to_on_destroy
    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { render :json=> {:success=>false, :message=>"Mensaje del on destroy"}, :status=>400 }
      # format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
    end
  end


end
