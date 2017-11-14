class UsuariosController < ApplicationController
  # before_action :authenticate_usuario! #, except: [:index, :home]
  # before_action :authenticate_user_from_token!

  before_action :comprobar, except: [:create]

  respond_to :json


  def index
    @usuarios = Usuario.all
    render json: @usuarios
  end

  def login
    @usuario = Usuario.find_by(nickname: params['nickname'], password: params['password'])
    render json: @usuario
  end

  ############################################################################## 

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
    render  json: @usuario
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    # respond_to do |format|
      # if @usuario.update(usuario_params)
      @usuario = Usuario.find_by_id(params[:id])
      p "-----------------------------------"
      p params[:usuario]
      p "-----------------------------------"
      if @usuario.update(usuario_params)
        # format.json { render :show, status: :ok, location: @usuario }
        render :json=> {:success=>true, :usuario=>@usuario, :message=>"Usuario actualizado correctamente"},:status=>200
      else
        render :json=> {:success=>false, :message=>"Error al actualizar"},:status=>404
        # format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy

    @resource = Usuario.find_for_database_authentication(:email => params[:user_login][:email])
    return invalid_login_attempt unless @resource

    if @resource.valid_password?(params[:user_login][:password])
      if @resource.authentication_token == params[:authentication_token]
        if @resource.destroy
          return render :json=> {:success=>true, :message=>"Usuario eliminado correctamente"}, :status=>200
        end
      else
        return render :json=> {:success=>false, :message=>"Error with your authentication_token"}, :status=>401
      end
    end
    return invalid_login_attempt
  end

  def contactos
    
  end

  def find
    p "-------------------------"
    p params[:search]
    p "-------------------------"
    @search = params[:search]
    # @result = Usuario.where(:nickname => params[:string]).or(Usuario.where(:email => params[:string]))
    @result = Usuario.where("nickname like ?", "#{@search}%").or(Usuario.where("email like ?", "#{@search}%")).where.not('confirmed_at' => nil)
    if(@result && @result.count > 0)
      render :json=>{:success=>true, :result=>@result},:status=>200
    else
      render :json=>{:success=>false, :result=>"No existe el usuario"},:status=>404
    end
  end

  private
  
  def comprobar
  if(!params.has_key?(:authentication_token))
    render :json=>{:success=>false, :message=>"falta parametro authentication_token"}, :status=>422
  else
    @user = Usuario.find_by_authentication_token(params[:authentication_token])
      if(!@user)
        render :json=>{:success=>false, :message=>"token mal"}, :status=>422
      end
      if(@user)
        return true
      end
    end
  end 
  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def usuario_params
     params.require(:usuario).permit(:nickname, :password, :email, :facebook, :twitter, :linkedin, :instagram, :avatar)
     # params.permit(:nickname, :password, :email, :facebook, :twitter, :linkedin, :instagram, :avatar)
  end

  protected
  def invalid_login_attempt
    # warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end

end
