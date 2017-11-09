class UsuariosController < ApplicationController
  # before_action :authenticate_usuario! #, except: [:index, :home]
  # before_action :authenticate_user_from_token!

  before_action :comprobar, except: [:create, :find]

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
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find_by_id(params["id"])
    p "-------------------------"
    p params
    p "-------------------------"
    p Usuario.find_by_id(params["id"])
    p "-------------------------"
    p @usuario
    p "-------------------------"
    @usuario.destroy
    render :json=> {:success=>true, :message=>"Usuario eliminado correctamente"}, :status=>200
    # respond_to do |format|
      # format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      # format.json { head :no_content }
    # end
  end

  def contactos
    
  end

  def find
    p "-------------------------"
    p params[:string]
    p "-------------------------"
    @search = params[:string]
    # @result = Usuario.where(:nickname => params[:string]).or(Usuario.where(:email => params[:string]))
    @result = Usuario.where("nickname like ?", "#{@search}%").or(Usuario.where("email like ?", "#{@search}%"))
    if(@result)
      render :json=>{:success=>true, :result=>@result},:status=>200
    else
      render :json=>{:success=>false, :result=>"No existe el usuario"},:status=>404
    end
  end

  private
  
  def comprobar
  if(!params.has_key?(:authentication_token))
    p "-------------------------"
    p session
    p "-------------------------"
    render :json=>{:success=>false, :message=>"falta parametro authentication_token"}, :status=>422
  else
    @user = Usuario.find_by_authentication_token(params[:authentication_token])
      # if(params[:authentication_token] != session[:hashAuth])
      if(!@user)
        render :json=>{:success=>false, :message=>"token mal"}, :status=>422
      # elsif (!@user.confirmed_at)
        # render :json=>{:success=>false, :message=>"El usuario indicado aun no ha confirmado su cuenta"}, :status=>422
      end
      if(@user)
        # render :json=>{:success=>true, :message=>"no comproba nada",:usuario => @user}, :status=>200
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
    params.require(:usuario).permit(:nickname, :password, :email, :facebook, :twitter, :linkedin, :avatar)
  end

end
