#encoding: utf-8
class TournamentPlayersController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :show,:new,:create,:teilnehmer]
  load_and_authorize_resource
  # GET /tournament_players
  def index
		@title = "Angemeldete Teilnehmer"
    @tournament_players = TournamentPlayer.all
  end

  # GET /tournament_players/1
  def show
    @tournament_player = TournamentPlayer.find(params[:id])
		@title ="Teilnehmer: #{@tournament_player.name}, #{@tournament_player.vorname}"
  end

  def teilnehmer
		@title = "Teilnehmer Liste"
		@teilnehmer = TournamentPlayer.all
		
  end

  # GET /tournament_players/new
  def new
		@title = "Neuer Teilnehmer"
    @tournament_player = TournamentPlayer.new
		if user_signed_in?
			@tournament_player.name = current_user.Name
			@tournament_player.vorname = current_user.Vorname
			@tournament_player.email = current_user.email
			@tournament_player.dgob = current_user.DGoB
			@tournament_player.studi = current_user.studi
			@tournament_player.rank = current_user.Rang
		end
  end

  # GET /tournament_players/1/edit
  def edit
    @tournament_player = TournamentPlayer.find(params[:id])
		@title ="Teilnehmer: #{@tournament_player.name}, #{@tournament_player.vorname}"
  end

  # POST /tournament_players
  def create
    @tournament_player = TournamentPlayer.new(params[:tournament_player])

    if @tournament_player.save
      redirect_to :controlelr => "tournament_players",:action => "teilnehmer" , notice: 'Sie wurden Erfolgreich für das Turnier Eingetragen.'
    else
      render action: "new" 
    end
  end

  # PUT /tournament_players/1
  def update
    @tournament_player = TournamentPlayer.find(params[:id])

    if @tournament_player.update_attributes(params[:tournament_player])
      redirect_to @tournament_player, notice: 'Tournament player was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /tournament_players/1
  def destroy
    @tournament_player = TournamentPlayer.find(params[:id])
    @tournament_player.destroy
		
		redirect_to tournament_players_url
  end

	# DELETE /tournament_players/all
	def destroy_all
		TournamentPlayer.destroy_all

		redirect_to tournament_players_url
	end
end
