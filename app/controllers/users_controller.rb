class UsersController < ApplicationController

  before_action :authenticate_user!
  #before_action :authorize_promotion, only: [:become_journalist]

  #GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    @team = Team.find(@user.team_id)

    if @user.type == 'Journalist'
      @articles = Article.where(user_id: @user.id).order(created_at: :desc)
    end

    if @user.type == 'TeamManager'
      @releases = Release.where(user_id: @user.id).order(created_at: :desc)
    end

    if @user.id.to_i == session[:user_id].to_i
      @saved = Save.where(user_id: session[:user_id])
      @saved_articles = Article.where(id: @saved.pluck(:article_id))
    end

  end

  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find_by(id: session[:user_id])
  end

  # POST /users or /users.json
  def create

    # Recupera le informazioni di autenticazione dalla sessione
    auth_info = session[:auth_info]

    # Recupera il team selezionato
    team_id = user_params[:team_id]
    bio = user_params[:bio]
    photo = user_params[:photo]

    if team_id.blank?
      redirect_to new_user_path, alert: 'You must select a team.'
      return
    end

    # Crea l'utente con le informazioni di autenticazione e il team selezionato
    @user = User.find_or_create_from_omniauth(auth_info, team_id, bio, photo)

    respond_to do |format|
      if @user.save
        session[:user_created] = true
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
    @user = User.find_by(id: session[:user_id])
    respond_to do |format|
      if user_params[:photo].present?
        if @user.update(team_id: user_params[:team_id], bio: user_params[:bio], photo: user_params[:photo])
          format.html { redirect_to user_path(@user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        if @user.update(team_id: user_params[:team_id], bio: user_params[:bio])
          format.html { redirect_to user_path(@user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
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

  def become_journalist
    current_user.become_journalist!
    redirect_to root_path, notice: 'You are now a journalist.'
  end

  private

  def authorize_promotion
    unless current_user.can_become_journalist? # Define this method in User model as needed
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:team_id, :bio, :photo)
    end
end
