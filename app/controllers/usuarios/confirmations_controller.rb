class Usuarios::ConfirmationsController < Devise::ConfirmationsController
  # POST /resource/confirmation
  def create
    # self.resource = resource_class.send_confirmation_instructions(resource_params)
    self.resource = resource_class.send_confirmation_instructions({email: current_user.email})
    if successfully_sent?(resource)
      respond_with({}, :location => after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end


  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      # set_flash_message!(:notice, :confirmed)
      p "--------------------------------------SIN ERRORES--------------------------------------------------------------"
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
      p "----------------------------------------------------------------------------------------------------"
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
    end
  end

  protected

  # The path used after resending confirmation instructions.
  def after_resending_confirmation_instructions_path_for(resource_name)
    root_path
  end
  def respond_with_navigational(resource)
    p "--------------------------------------RESPOND WITH NAVIGATIONAL--------------------------------------------------------------"
    return render :json =>{:success=>true, :message=>"Esto es el RESPOND WITH NAVIGATIONAL",:usuario=>resource}, :status=>200
    p "----------------------------------------------------------------------------------------------------"
  end
  def after_confirmation_path_for(resource_name, resource)
    # super(resource_name, resource)
    p "--------------------------------------AFTER CONFIRMATION PATH FOR--------------------------------------------------------------"
    return render :json =>{:success=>true, :message=>"Esto es el after_confirmation_path_for",:usuario=>resource}, :status=>200
    p "----------------------------------------------------------------------------------------------------"
  end
  # def show
  #   self.resource = resource_class.confirm_by_token(params[:confirmation_token])

  #   if resource.errors.empty?
  #     set_flash_message(:notice, :confirmed) if is_navigational_format?
  #     sign_in(resource_name, resource)
  #     respond_with_navigational(resource){ redirect_to confirmation_getting_started_path }
  #   else
  #     respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render_with_scope :new }
  #   end
  # end
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  
end
