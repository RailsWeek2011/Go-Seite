class TournamentInformationsController < ApplicationController
  # GET /tournament_informations
  # GET /tournament_informations.json
  def index
    @tournament_informations = TournamentInformation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tournament_informations }
    end
  end

  # GET /tournament_informations/1
  # GET /tournament_informations/1.json
  def show
    @tournament_information = TournamentInformation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tournament_information }
    end
  end

  # GET /tournament_informations/new
  # GET /tournament_informations/new.json
  def new
    @tournament_information = TournamentInformation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tournament_information }
    end
  end

  # GET /tournament_informations/1/edit
  def edit
    @tournament_information = TournamentInformation.find(params[:id])
  end

  # POST /tournament_informations
  # POST /tournament_informations.json
  def create
    @tournament_information = TournamentInformation.new(params[:tournament_information])

    respond_to do |format|
      if @tournament_information.save
        format.html { redirect_to @tournament_information, notice: 'Tournament information was successfully created.' }
        format.json { render json: @tournament_information, status: :created, location: @tournament_information }
      else
        format.html { render action: "new" }
        format.json { render json: @tournament_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tournament_informations/1
  # PUT /tournament_informations/1.json
  def update
    @tournament_information = TournamentInformation.find(params[:id])

    respond_to do |format|
      if @tournament_information.update_attributes(params[:tournament_information])
        format.html { redirect_to @tournament_information, notice: 'Tournament information was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tournament_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_informations/1
  # DELETE /tournament_informations/1.json
  def destroy
    @tournament_information = TournamentInformation.find(params[:id])
    @tournament_information.destroy

    respond_to do |format|
      format.html { redirect_to tournament_informations_url }
      format.json { head :ok }
    end
  end
end
