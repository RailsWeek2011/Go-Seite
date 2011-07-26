class TournamentResultsController < ApplicationController
  # GET /tournament_results
  # GET /tournament_results.json
  def index
    @tournament_results = TournamentResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tournament_results }
    end
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
