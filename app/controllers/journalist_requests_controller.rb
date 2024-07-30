# app/controllers/journalist_requests_controller.rb
class JournalistRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:index, :approve, :reject]

  def new
    if current_user.type == 'User'
      @journalist_request = JournalistRequest.new
    else
      redirect_to user_dashboard_path, notice: "Non puoi fare richieste da giornalista."
    end
  end

  def create
    if current_user.type == 'User'
      @journalist_request = JournalistRequest.new(journalist_request_params)
      @journalist_request.user = current_user

      if @journalist_request.save
        redirect_to root_path, notice: "Richiesta inviata con successo."
      else
        render :new
      end
    else
      redirect_to user_dashboard_path, notice: "Non puoi fare richieste da giornalista."
    end
  end

  def index
    @journalist_requests = JournalistRequest.all
  end

  def approve
    @journalist_request = JournalistRequest.find(params[:id])
    @journalist_request.user.update(type: 'Journalist')
    @journalist_request.destroy
    redirect_to journalist_requests_path, notice: "Richiesta approvata."
  end

  def reject
    @journalist_request = JournalistRequest.find(params[:id])
    @journalist_request.destroy
    redirect_to journalist_requests_path, notice: "Richiesta rifiutata."
  end

  private

  def journalist_request_params
    params.require(:journalist_request).permit(:certificate)
  end

  def authenticate_admin!
    redirect_to root_path, alert: "Accesso negato." unless current_user.type == 'Admin'
  end
end
