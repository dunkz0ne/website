class UsersController < ApplicationController
  #before_action :set_user, only: %i[ show edit update destroy ]

  #GET /users/1 or /users/1.json
  def show
    @user
  end

  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user
  end

  # POST /users or /users.json
  def create

    # Recupera le informazioni di autenticazione dalla sessione
    auth_info = session[:auth_info]

    # Recupera il team selezionato
    team_id = user_params[:team_id]

    if team_id.blank?
      redirect_to new_user_path, alert: 'You must select a team.'
      return
    end

    # Crea l'utente con le informazioni di autenticazione e il team selezionato
    @user = User.find_or_create_from_omniauth(auth_info, team_id)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_dashboard_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find_by(provider: session[:auth_info][:provider], id: session[:auth_info][:uid  ])
    respond_to do |format|
      if @user.update(team_id: user_params[:team_id])
        format.html { redirect_to user_dashboard_path, notice: "User was successfully updated." }
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
      format.html { redirect_to root_path, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Only allow a list of trusted parameters through.
  def validate_team_id
    team_exists = Team.exists?(id: params[:team_id])
    render json: { valid: team_exists }
  end

  private


    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:team_id)
    end
end
