class ForumAreasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource 

  # GET /forum_areas
  def index	
		@title = "Forum"
    @forum_areas = ForumArea.all
  end

  # GET /forum_areas/1
  def show		
    @forum_area = ForumArea.find(params[:id])
		@title = "Forum ".+(@forum_area.title)
  end

  # GET /forum_areas/new
  def new
		@title = "Neuer Bereich"
    @forum_area = ForumArea.new
  end

  # GET /forum_areas/1/edit
  def edit
		if params[:id] == "1"
			redirect_to :controller => "forum_areas", :action => "index"
		end
    @forum_area = ForumArea.find(params[:id])
		@title = "Bereich bearbeiten"
  end

  # POST /forum_areas
  def create
    @forum_area = ForumArea.new(params[:forum_area])
		@title = "Neuer Bereich"
   
    if @forum_area.save
      redirect_to @forum_area, notice: 'Forum area was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /forum_areas/1
  def update
		@title = "Bereich bearbeiten"
		if params[:id] == "1"
			redirect_to :controller => "forum_areas", :action => "index"
		end
    @forum_area = ForumArea.find(params[:id])

    if @forum_area.update_attributes(params[:forum_area])
      redirect_to @forum_area, notice: 'Forum area was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  # DELETE /forum_areas/1
  def destroy
		if params[:id] == "1"
			redirect_to :controller => "forum_areas", :action => "index"
		end
    @forum_area = ForumArea.find(params[:id])
    @forum_area.destroy

      redirect_to forum_areas_url 
  end
end
