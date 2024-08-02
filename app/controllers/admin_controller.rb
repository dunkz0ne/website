class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!

  def show
    redirect_to user_path(session[:user_id])
  end

  def update
    @admin = User.find_by(id: session[:user_id])
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: "Admin was successfully updated." }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Ensure the current user is an admin
    def ensure_admin!
      unless current_user.type == 'Admin'
        redirect_to root_path, alert: 'Non sei autorizzato ad accedere a questa pagina.'
      end
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:team_id, :bio, :photo)
    end
end
