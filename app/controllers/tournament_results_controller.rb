#encoding: utf-8
class TournamentResultsController < ApplicationController
  # GET /tournament_results
  def index
		@title = "Ergebnis Übersicht"
    @tournament_results = TournamentResult.all
		@players = TournamentPlayer.all
		@rounds = []
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
  end

  # GET /tournament_results/1
  def show
    @tournament_result = TournamentResult.find(params[:id])

  end

  # GET /tournament_results/new
  def new
    @tournament_result = TournamentResult.new

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

  # GET /tournament_results/1
  def update

		

  #  	@tournament_result = TournamentResult.find(params[:id])
	#		
	#		  if @tournament_result.update_attributes(params[:tournament_result])
	#			  redirect_to @tournament_result, notice: 'Tournament result was successfully updated.'
	#		  else
	#		    render action: "edit"
	#			end
  end

  # DELETE /tournament_results/1
  # DELETE /tournament_results/1.json
  def destroy
    @tournament_result = TournamentResult.find(params[:id])
    @tournament_result.destroy

    respond_to do |format|
      format.html { redirect_to tournament_results_url }
      format.json { head :ok }
    end
  end
end
