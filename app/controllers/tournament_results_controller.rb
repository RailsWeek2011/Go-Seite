#encoding: utf-8
class TournamentResultsController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource

  # GET /tournament_results
  def index
		@title = "Ergebnis Übersicht"
    @tournament_results = TournamentResult.all
		@players = TournamentPlayer.all
		@rounds = []
		@gewinner = nil
		i = 1
		inLoop = true
		begin 
			round = TournamentResult.where("runde = ?",i)
			if round.count == 0
				inLoop = false
			else
				@rounds.push round  
			end
			i = i+1
		end while inLoop
		
		if @rounds.count >=1 && @rounds.last.count == 1
			case @rounds.last.last.ergebnis
					when 1
						@gewinner = @rounds.last.last.spieler1
					when 2
						@gewinner = @rounds.last.last.spieler2
				end
		end
  end

  # GET /tournament_results/1
  def show
    @tournament_result = TournamentResult.find(params[:id])

  end

  # GET /tournament_results/new
  def new
		round = 1	
		
		if TournamentResult.count == 0
			players = TournamentPlayer.all
		else
			round = TournamentResult.last.runde
			games_all = TournamentResult.where("runde = ?",round)
			round = round + 1
			players = []
			games_all.each do |game|
				case game.ergebnis
					when 1
						players.push game.spieler1
					when 2
						players.push game.spieler2
					when 3
						players.push game.spieler1
				end
			end # games_all.each
		end
		unless players.count == 1
			# Matches 
			begin
				tr = TournamentResult.new
				tr.spieler1 = players.sample
				players.delete tr.spieler1
				tr.runde = round
				if players.count >= 1
					tr.spieler2 = players.sample
					players.delete tr.spieler2
					tr.ergebnis = 0
				else
					tr.spieler2 = nil
					tr.ergebnis = 3
				end
				tr.save
			end while not players.count == 0
		end
		redirect_to :controller => "tournament_results", :action => "index"
  end
	
  # GET /tournament_results/1/edit
  def edit	
		if TournamentResult.exists?(params[:id])
			if params[:player].to_i == 1 || params[:player].to_i == 2
		  	tournament_result = TournamentResult.find(params[:id])
				if TournamentResult.where("runde = ?",tournament_result.runde+1) == []
					tournament_result.ergebnis = params[:player]
					tournament_result.save
				
				end
			end
		end
		redirect_to :controller => "tournament_results", :action => "index"
  end

  # POST /tournament_results
  def create
    @tournament_result = TournamentResult.new(params[:tournament_result])

    if @tournament_result.save
      redirect_to @tournament_result, notice: 'Tournament result was successfully created.'
    else
      render action: "new"
    end
  end

  # DELETE /tournament_results/1
  def destroy
    @tournament_result = TournamentResult.where("runde = ?",TournamentResult.last.runde)
    @tournament_result.destroy_all

    redirect_to tournament_results_url 
  end
	def destroy_all
    TournamentResult.destroy_all
    redirect_to tournament_results_url 
  end
end
