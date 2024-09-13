class JournalistRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:index, :approve, :reject]
  rescue_from ActionController::ParameterMissing, with: :handle_missing_params

  def new
    if not current_user.type?
      @journalist_request = JournalistRequest.new
      @team = Team.find_by(id: current_user.team_id)
    else
      redirect_to user_dashboard_path, notice: "Non puoi fare richieste da giornalista."
    end
  end

  def create
    if not current_user.type?
      @journalist_request = JournalistRequest.new(journalist_request_params)
      @journalist_request.user = current_user

      if @journalist_request.save
        redirect_to user_dashboard_path, notice: "Request sent successfully."
      else
        render :new, notice: "Error sending request."
      end
    else
      redirect_to user_dashboard_path, notice: "You can't make journalist requests."
    end
  end

  def index
    @journalist_requests = JournalistRequest.all
  end

  def destroy
  end

  def delete
    @journalist_request = JournalistRequest.find(params[:id])
    if (params[:accept] == 'true')
      @journalist_request.user.update(type: 'Journalist')
    end
    @journalist_request.destroy
    if (params[:accept] == 'true')
      redirect_to admin_dashboard_user_path, notice: "Richiesta approvata."
    else
      redirect_to admin_dashboard_user_path, notice: "Richiesta rifiutata."
    end
  end

  private

  def journalist_request_params
    params.require(:journalist_request).permit(:certificate)
  end

  def authenticate_admin!
    redirect_to root_path, alert: "Accesso negato." unless current_user.type == 'Admin'
  end

  def handle_missing_params
    flash[:alert] = "No certificate attached"
    redirect_to new_journalist_request_path
  end
end
