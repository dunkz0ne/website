class JournalistsController < ApplicationController

  before_action :authenticate_user!

  def index
    @journalist = Journalist.all
  end

  def show
    @joirnalist = current_user
    redirect_to @journalist
  end

  def new
    @journalist = Journalist.new
  end

  def create
    @journalist = Journalist.new(journalist_params)

    respond_to do |format|
      if @journalist.save
        format.html { redirect_to @journalist, notice: "Journalist was successfully created." }
        format.json { render :show, status: :created, location: @journalist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @journalist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @journalist = current_user
    respond_to do |format|
      if @journalist.update(journalist_params)
        format.html { redirect_to @journalist, notice: "Journalist was successfully updated." }
        format.json { render :show, status: :ok, location: @journalist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @journalist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @journalist = current_user
    @journalist.destroy
    respond_to do |format|
      format.html { redirect_to journalists_url, notice: "Journalist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def journalist_params
      params.require(:journalist).permit(:team_id, :bio, :photo)
    end

end
