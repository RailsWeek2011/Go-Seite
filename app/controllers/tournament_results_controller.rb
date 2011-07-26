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
				#round[i-1].sp1 = TournamentPlayer.find round[i-1].spieler1
				@rounds.push round  
			end
			i = i+1
		end while inLoop
  end

  # GET /tournament_results/1
  # GET /tournament_results/1.json
  def show
    @tournament_result = TournamentResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tournament_result }
    end
  end

  # GET /tournament_results/new
  # GET /tournament_results/new.json
  def new
    @tournament_result = TournamentResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tournament_result }
    end
  end

  # GET /tournament_results/1/edit
  def edit
    @tournament_result = TournamentResult.find(params[:id])
  end

  # POST /tournament_results
  # POST /tournament_results.json
  def create
    @tournament_result = TournamentResult.new(params[:tournament_result])

    respond_to do |format|
      if @tournament_result.save
        format.html { redirect_to @tournament_result, notice: 'Tournament result was successfully created.' }
        format.json { render json: @tournament_result, status: :created, location: @tournament_result }
      else
        format.html { render action: "new" }
        format.json { render json: @tournament_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tournament_results/1
  # PUT /tournament_results/1.json
  def update
    @tournament_result = TournamentResult.find(params[:id])

    respond_to do |format|
      if @tournament_result.update_attributes(params[:tournament_result])
        format.html { redirect_to @tournament_result, notice: 'Tournament result was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tournament_result.errors, status: :unprocessable_entity }
      end
    end
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
