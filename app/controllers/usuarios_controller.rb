class UsuariosController < ApplicationController
  before_action :authenticate_usuario! #, except: [:index, :home]
  # before_action :authenticate_user_from_token!

  before_action :comprobar, except: [:create]

  respond_to :json

  private def comprobar
    if(!params.has_key?(:authenticate_token))
      render :json=>{:success=>false, :message=>"falta parametro authenticate_token"}, :status=>422
    else
      @user = Usuario.find_by_authentication_token(params[:authenticate_token])
      if(@user)
        # render :json=>{:success=>true, :message=>"no comproba nada",:usuario => @user}, :status=>200
        return true
      else
        render :json=>{:success=>false, :message=>"token mal"}, :status=>422
      end
    end
  end 

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
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def usuario_params
    params.require(:usuario).permit(:nickname, :password, :email, :facebook, :twitter, :linkedin, :avatar)
  end

end
