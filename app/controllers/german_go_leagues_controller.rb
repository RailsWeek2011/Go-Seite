class GermanGoLeaguesController < ApplicationController
  # GET /german_go_leagues
  # GET /german_go_leagues.json
  def index
    @german_go_leagues = GermanGoLeague.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @german_go_leagues }
    end
  end

  # GET /german_go_leagues/1
  # GET /german_go_leagues/1.json
  def show
    @german_go_league = GermanGoLeague.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @german_go_league }
    end
  end

  # GET /german_go_leagues/new
  # GET /german_go_leagues/new.json
  def new
    @german_go_league = GermanGoLeague.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @german_go_league }
    end
  end

  # GET /german_go_leagues/1/edit
  def edit
    @german_go_league = GermanGoLeague.find(params[:id])
  end

  # POST /german_go_leagues
  # POST /german_go_leagues.json
  def create
    @german_go_league = GermanGoLeague.new(params[:german_go_league])

    respond_to do |format|
      if @german_go_league.save
        format.html { redirect_to @german_go_league, notice: 'German go league was successfully created.' }
        format.json { render json: @german_go_league, status: :created, location: @german_go_league }
      else
        format.html { render action: "new" }
        format.json { render json: @german_go_league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /german_go_leagues/1
  # PUT /german_go_leagues/1.json
  def update
    @german_go_league = GermanGoLeague.find(params[:id])

    respond_to do |format|
      if @german_go_league.update_attributes(params[:german_go_league])
        format.html { redirect_to @german_go_league, notice: 'German go league was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @german_go_league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /german_go_leagues/1
  # DELETE /german_go_leagues/1.json
  def destroy
    @german_go_league = GermanGoLeague.find(params[:id])
    @german_go_league.destroy

    respond_to do |format|
      format.html { redirect_to german_go_leagues_url }
      format.json { head :ok }
    end
  end
end
