class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_admin!, only: [:increment_strikes, :decrement_strikes]
  helper_method :banned?

  #GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    @team = Team.find(@user.team_id)
    @current_user_team = Team.find(current_user.team_id)

    if @user.type == 'Journalist'
      @articles = Article.where(user_id: @user.id, draft: false).order(created_at: :desc)
      @articles.each do |article|
        article.team = Team.find(article.team_id)
      end
    end

    if @user.type == 'TeamManager'
      @releases = Release.where(user_id: @user.id).order(created_at: :desc)
    end

    if @user.type == 'Admin'

      @journalist_requests = if params[:search_request].present?
        JournalistRequest.joins(:user).where('users.name LIKE ?', "%#{params[:search_request]}%")
      else
        JournalistRequest.all
      end

      @comments = if params[:search_comments].present?
        Comment.joins(:user).where('users.name LIKE ?', "%#{params[:search_comments]}%")
      else
        Comment.all
      end

      @articles = if params[:search_articles].present?
        Article.joins(:user).where('users.name LIKE ?', "%#{params[:search_articles]}%")
      else
        Article.all
      end

      @users = if params[:search_users].present?
        User.where('name LIKE ?', "%#{params[:search_users]}%")
      else
        User.all
      end

    else

      @comments = Comment.where(user_id: @user.id).order(created_at: :desc)

      @comments.each do |comment|
        comment.article = Article.find(comment.article_id)
      end
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
      @saved_articles.each do |article|
        article.team = Team.find(article.team_id)
      end
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

    if auth_info[:provider] == 'email'
      # Crea l'utente con le informazioni di autenticazione fornite tramite email
      @user = User.create(email: auth_info[:email], password: auth_info[:password], provider: 'email', name: auth_info[:name], team_id: team_id, bio: bio, photo: photo)
      session[:user_id] = @user.id
    else
      # Crea l'utente con le informazioni di autenticazione fornite tramite oauth
      @user = User.find_or_create_from_omniauth(auth_info, team_id, bio, photo)
    end

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

  def become_team_manager
    current_user.become_team_manager!
    redirect_to root_path, notice: 'You are now a team manager.'
  end

  # Method to increment the strikes of a user
  def increment_strikes
    @user = User.find_by(id: params[:id])
    # If the user has 3 strikes, he will be banned
    if @user.strikes == 3
      #Not incrementing strikes if user is already banned
    elsif @user.strikes >= 2
      @user.increment!(:strikes)
      @user.ban!(by_admin: @current_user)
    else
      @user.increment!(:strikes)
    end
    redirect_to admin_dashboard_user_path(@current_user), notice: 'Strikes incremented.'
  rescue => e
    redirect_to admin_dashboard_user_path(@current_user), alert: e.message
  end

  # Method to decrement the strikes of a user
  def decrement_strikes
    @user = User.find(params[:id])
    if @user.strikes > 0
      @user.decrement!(:strikes)
    else
      raise "Strikes cannot be negative."
    end
    redirect_to admin_dashboard_user_path(@current_user), notice: 'Strikes decremented.'
  rescue => e
    redirect_to admin_dashboard_user_path(@current_user), alert: e.message
  end

  # Method to ban a user
  def ban_users
    user_ids = params[:user_ids]
    reason = params[:reason]
    from = params[:from].present? ? Time.parse(params[:from]) : Time.now
    to = params[:to].present? ? Time.parse(params[:to]) : nil

    if user_ids.present?
      users = User.where(id: user_ids)
      users.each do |user|
        user.ban!(by_admin: @current_user, from: from, to: to, reason: reason)
      end
      flash[:notice] = "Selected users have been banned."
    else
      flash[:alert] = "No users selected for banning."
    end

    redirect_to admin_dashboard_user_path(@current_user), notice: 'Users banned.'
  end

  # Method to unban a user
  def unban
    @user = User.find(params[:id])
    if @user.banned_users.present?
      @user.banned_users.destroy_all
      @user.reset_strikes_for_users_with_same_email(@user.email)
    end
    redirect_to admin_dashboard_user_path(@current_user), notice: 'User unbanned.'
  end

  def delete_articles
    article_ids = params[:article_ids]

    if article_ids.present?
      @articles = Article.where(id: article_ids)
      @articles.each do |article|
        @article.delete
      end
      flash[:notice] = "Selected articles have been deleted."
    else
      flash[:alert] = "No articles selected for deletion."
    end
    redirect_to admin_dashboard_user_path(@current_user), notice: 'Articles Deleted.'
  end

  def admin_dashboard
    @user = User.find_by(id: session[:user_id])
    @team = Team.find(@user.team_id)
    if @user.type == 'Admin'

      @journalist_requests = if params[:search_request].present?
        JournalistRequest.joins(:user).where('users.name LIKE ?', "%#{params[:search_request]}%")
      else
        JournalistRequest.all
      end

      @comments = if params[:search_comments].present?
        Comment.joins(:user).where('users.name LIKE ?', "%#{params[:search_comments]}%")
      else
        Comment.all
      end

      @articles = if params[:search_articles].present?
        Article.joins(:user).where('users.name LIKE ?', "%#{params[:search_articles]}%")
      else
        Article.all
      end

      @users = if params[:search_users].present?
        User.where('name LIKE ?', "%#{params[:search_users]}%")
      else
        User.all
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:team_id, :bio, :photo, :search_users, :search_articles)
    end

    # Method to ensure that the user is an admin
    def ensure_admin!
      unless @current_user.type == 'Admin'
        redirect_to root_path, alert: 'Non sei autorizzato ad accedere a questa pagina.'
      end
    end
end
