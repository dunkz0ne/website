class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_admin!, only: [:increment_strikes, :decrement_strikes]
  helper_method :banned?

  #GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    @team = Team.find(@user.team_id)

    if @user.type == 'Journalist'
      @articles = Article.where(user_id: @user.id, draft: false).order(created_at: :desc)
    end

    if @user.type == 'TeamManager'
      @releases = Release.where(user_id: @user.id).order(created_at: :desc)
    end

    if @user.type == 'Admin'
      @journalist_requests = JournalistRequest.all
      @users = if params[:search].present?
        User.where('name LIKE ?', "%#{params[:search]}%")
      else
        User.all
      end
    end


    @comments = Comment.where(user_id: @user.id).order(created_at: :desc)

    @comments.each do |comment|
      comment.article = Article.find(comment.article_id)
    end



    if @user.id.to_i == session[:user_id].to_i
      @saved = SaveComment.where(user_id: @user.id)
      @saved_comments = Comment.where(id: @saved.pluck(:comment_id))
      @saved_comments.each do |saved_comment|
        saved_comment.article = Article.find(saved_comment.article_id)
        saved_comment.user = User.find(saved_comment.user_id)
      end
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

  def destroy
  end

  # DELETE /users/1 or /users/1.json
  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path(@current_user), notice: 'User deleted.'
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

  def become_team_manager
    current_user.become_team_manager!
    redirect_to root_path, notice: 'You are now a team manager.'
  end

  def become_admin
    current_user.become_admin!
    redirect_to root_path, notice: 'You are now an admin.'
  end

  # Method to increment the strikes of a user
  def increment_strikes
    @user = User.find_by(id: params[:id])
    # If the user has 3 strikes, he will be banned
    if @user.strikes == 3
      @user.ban!(by_admin: @current_user)
    else
      @user.increment!(:strikes)
    end
    redirect_to user_path(@current_user), notice: 'Strikes incrementati con successo.'
  rescue => e
    redirect_to user_path(@current_user), alert: e.message
  end

  # Method to decrement the strikes of a user
  def decrement_strikes
    @user = User.find(params[:id])
    if @user.strikes > 0
      @user.decrement!(:strikes)
    else
      raise "Gli strikes sono già a zero."
    end
    redirect_to user_path(@current_user), notice: 'Strikes decrementati con successo.'
  rescue => e
    redirect_to user_path(@current_user), alert: e.message
  end

  def update_users
    users_params.each do |user_id, user_params|
      user = User.find(user_id)
      user.update(user_params)
    end
    redirect_to edit_strikes_admins_path, notice: 'Strikes aggiornati con successo!'
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:team_id, :bio, :photo)
    end

    # Method to ensure that the user is an admin
    def ensure_admin!
      unless @current_user.type == 'Admin'
        redirect_to root_path, alert: 'Non sei autorizzato ad accedere a questa pagina.'
      end
    end
end
