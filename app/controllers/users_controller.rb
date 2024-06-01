class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :configure_sign_up_params, only: [:create]

  #GET /users/1 or /users/1.json
  def show
    @users = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(id: session["devise.facebook_data"]["uid"], name: session["devise.facebook_data"]["info"]["name"],email: session["devise.facebook_data"]["info"]["email"], team_id: team_id)
    #@user = User.new(id: id, name: name, email: email, password: password, team_id: team_id)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:id ,:name, :email, :password, :team_id)
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:team_id, :id, :email, :password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:team_id])
    end
end
