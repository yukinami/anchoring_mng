class UsersController < ApplicationController
  before_filter :admin_permission, except: [:edit_password, :update_password]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # GET /users/1/change_password
  def edit_password 
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save 
        format.html { redirect_to users_url, notice: "User #{@user.name} was successfully created." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id]) 
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url, notice: 'User #{@user.name} was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update_password
    @user = User.find(params[:id]) 
    
    respond_to do |format|
      if @user.hashed_password != User.encrypt_password(params[:old_password], @user.salt)
	@user.errors.add(:base, :old_password_not_correct)
	format.html { render action: "edit_password" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      elsif @user.update_attributes(params[:user])
	session[:user_id] = nil
        format.html { redirect_to login_url, alert: I18n.t('msg.update_password_success') }
        format.json { head :no_content }
      else
        format.html { render action: "edit_password" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
