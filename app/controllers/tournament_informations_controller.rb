class TournamentInformationsController < ApplicationController
  # GET /tournament_informations
  def index
    @tournament_informations = TournamentInformation.all
  end

  # GET /tournament_informations/1
  def show
    @tournament_information = TournamentInformation.find(params[:id])
    
  end

  def ausschreibung
    @information = TournamentInformation.find(params[:id]).ausschreibung
		render action: "information"
  end
	def anfahrt
    @information = TournamentInformation.find(params[:id]).anfahrt
		render action: "information"
  end
  def kontakt
    @information = TournamentInformation.find(params[:id]).kontakt
		render action: "information"
  end

  # GET /tournament_informations/new
  def new
    @tournament_information = TournamentInformation.new
  end

  # GET /tournament_informations/1/edit
  def edit
    @tournament_information = TournamentInformation.find(params[:id])
  end

  # POST /tournament_informations
  def create
    @tournament_information = TournamentInformation.new(params[:tournament_information])

    if @tournament_information.save
      redirect_to @tournament_information, notice: 'Tournament information was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /tournament_informations/1
  def update
    @tournament_information = TournamentInformation.find(params[:id])

    if @tournament_information.update_attributes(params[:tournament_information])
      redirect_to @tournament_information, notice: 'Tournament information was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /tournament_informations/1
  def destroy
    @tournament_information = TournamentInformation.find(params[:id])
    @tournament_information.destroy
		redirect_to tournament_informations_url
  end
end
