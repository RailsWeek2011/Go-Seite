class ForumAreasController < ApplicationController
  # GET /forum_areas
  def index
    @forum_areas = ForumArea.all

  end

  # GET /forum_areas/1
  def show
    @forum_area = ForumArea.find(params[:id])
  end

  # GET /forum_areas/new
  def new
    @forum_area = ForumArea.new
  end

  # GET /forum_areas/1/edit
  def edit
    @forum_area = ForumArea.find(params[:id])
  end

  # POST /forum_areas
  def create
    @forum_area = ForumArea.new(params[:forum_area])

      if @forum_area.save
        redirect_to @forum_area, notice: 'Forum area was successfully created.' 
      else
        render action: "new" 
      end
  end

  # PUT /forum_areas/1
  def update
    @forum_area = ForumArea.find(params[:id])

      if @forum_area.update_attributes(params[:forum_area])
        redirect_to @forum_area, notice: 'Forum area was successfully updated.' 
      else
        render action: "edit" 
      end
  end

  # DELETE /forum_areas/1
  def destroy
    @forum_area = ForumArea.find(params[:id])
    @forum_area.destroy

      redirect_to forum_areas_url 
  end
end
