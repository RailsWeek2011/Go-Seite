class TournamentInformationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show,:ausschreibung]
  load_and_authorize_resource

	# GET /tournament_informations
  def index
		@title = "Turnierverwaltung"
    @tournament_informations = TournamentInformation.all
  end

  # GET /tournament_informations/1
  def show
		@tournament_information = TournamentInformation.find(params[:id])
  end

  def ausschreibung
		@title = "Turnier Ausschreibung"
    if params[:id] == nil
			@information = TournamentInformation.last.ausschreibung
		else
    	@information = TournamentInformation.find(params[:id]).ausschreibung
		end
		render action: "information"
  end

	def anfahrt
		@title = "Turnier Anfahrt"
    if params[:id] == nil
			@information = TournamentInformation.last.anfahrt
		else
    	@information = TournamentInformation.find(params[:id]).anfahrt
		end
		render action: "information"
  end

  def kontakt
		@title = "Turnier Kontakt"
    if params[:id] == nil
			@information = TournamentInformation.last.kontakt
		else
    	@information = TournamentInformation.find(params[:id]).kontakt
		end
		render action: "information"
  end

  # GET /tournament_informations/new
  def new
    @tournament_information = TournamentInformation.new
  end

  # GET /tournament_informations/1/edit
  def edit
		@title = "Turnier bearbeiten"
    @tournament_information = TournamentInformation.find(params[:id])
  end

  # POST /tournament_informations
  def create
    @tournament_information = TournamentInformation.new(params[:tournament_information])

    if @tournament_information.save
      redirect_to :controller=>"tournament_informations", :action => "index", notice: 'Turnier wurde Erstellt.'
    else
      render action: "new"
    end
  end

  # PUT /tournament_informations/1
  def update
    @tournament_information = TournamentInformation.find(params[:id])

    if @tournament_information.update_attributes(params[:tournament_information])
      redirect_to :controller => "tournament_informations", :action => "index" , notice: 'Turnier wurde erfolgreich Bearbeitet.'
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
