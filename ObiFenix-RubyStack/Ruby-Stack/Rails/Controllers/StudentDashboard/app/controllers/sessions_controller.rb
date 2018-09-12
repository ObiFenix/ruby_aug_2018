class SessionsController < ApplicationController

  before_action :set_manager, only: [:first_name, :last_name, :email, :password, :password_confirmation]

  def index
    if current_manager
      redirect_to songs_path
    end
    Manager.new
    @errors = []
  end

  # =============================
  # Switch Controller for Log/Reg
  # =============================
  def switch
    if session[:form] === "login"
      session[:form] = "register"
    else
      session[:form] = "login"
    end
    redirect_to "/"
  end


  # =====================================
  # Handles manager Login <managers/login> form
  # =====================================
  def login
    @manager = Manager.find_by_email(params[:email])
    if @manager and @manager.authenticate(params[:password])
      session["manager_id"] = @manager.id
      redirect_to songs_path
    else
      flash[:errors] = ["Invalid login information!"]
      redirect_to :back
    end
  end


  # ===============================================
  # Handles Manager Registration <managers/register> form
  # ===============================================
  def register
    @manager = Manager.create(manager_params)
    unless @manager.valid?
      flash[:errors] = @manager.errors.full_messages
      redirect_to :back
    else
      session["manager_id"] = @manager.id
      redirect_to root_path
    end
  end


  # =============================
  # GET Request - Renders [.html]
  # =============================
  def new
    @manager = Manager.new
  end


  # ====================
  # POST Request [.html]
  # POST Request [.json]
  # ====================
  def create
    @manager = Manager.create(validate_params)
    respond_to do |format|
      if @manager.valid?
        format.html { redirect_to "/", notice: 'Manager was successfully created.' }
        format.json { redirect_to :back, status: :created, location: @manager }
      else
        format.html { redirect_to :back }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end


  # ===============================
  # DELETE request for </logout>
  # >> This shall terminate session
  # ===============================
  def logout
    reset_session
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Manager was successfully logged out.' }
      format.json { head :no_content }
    end
  end


  # ===================
  # DELETE /manager/1
  # DELETE /manager/1.json
  # ===================
  def destroy
    Manager.find(params[:id]).destroy
    respond_to do |format|
      # format.html { redirect_to '/', notice: 'Manager was successfully destroyed.' }
      format.html { redirect_to "/managers/#{params[:manager_id]}", notice: 'Manager was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = Manager.find(params[:id])
    end

    # Sanatizing/Validating Form Parameters...
  private
    def manager_params
      params.require(:manager).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
