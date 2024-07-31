class AdminController < ActionController::Base
  before_action :authenticate_user!
  before_action :ensure_admin!



  private

  def ensure_admin!
    unless current_user.admin?
      redirect_to root_path, alert: 'Non sei autorizzato ad accedere a questa pagina.'
    end
  end
end
