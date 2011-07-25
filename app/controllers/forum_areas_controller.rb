class ForumAreasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource 

  # GET /forum_areas
  # GET /forum_areas.json
  def index
    @forum_areas = ForumArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forum_areas }
    end
  end

  # GET /forum_areas/1
  # GET /forum_areas/1.json
  def show
    #@forum_area = ForumArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @forum_area }
    end
  end

  # GET /forum_areas/new
  # GET /forum_areas/new.json
  def new
    #@forum_area = ForumArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @forum_area }
    end
  end

  # GET /forum_areas/1/edit
  def edit
    #@forum_area = ForumArea.find(params[:id])
  end

  # POST /forum_areas
  # POST /forum_areas.json
  def create
    #@forum_area = ForumArea.new(params[:forum_area])

    respond_to do |format|
      if @forum_area.save
        format.html { redirect_to @forum_area, notice: 'Forum area was successfully created.' }
        format.json { render json: @forum_area, status: :created, location: @forum_area }
      else
        format.html { render action: "new" }
        format.json { render json: @forum_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forum_areas/1
  # PUT /forum_areas/1.json
  def update
    #@forum_area = ForumArea.find(params[:id])

    respond_to do |format|
      if @forum_area.update_attributes(params[:forum_area])
        format.html { redirect_to @forum_area, notice: 'Forum area was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @forum_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_areas/1
  # DELETE /forum_areas/1.json
  def destroy
    #@forum_area = ForumArea.find(params[:id])
    #@forum_area.destroy

    respond_to do |format|
      format.html { redirect_to forum_areas_url }
      format.json { head :ok }
    end
  end
end
