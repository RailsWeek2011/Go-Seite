class ForumThreadsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show,:news]
  load_and_authorize_resource

	def news
		@title = "News"
		@forum_thread = ForumThread.where("area_id = 1")
	end

  # GET /forum_threads/1
  def show
    @forum_thread = ForumThread.find(params[:id])
		@title = @forum_thread.title
  end

  # GET /forum_threads/new
  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_area_id = params[:id]
		@title = "Neuer Thread im Bereich \"".+(ForumArea.find(params[:id]).title).+"\""
  end

  # GET /forum_threads/1/edit
  def edit
    @forum_thread = ForumThread.find(params[:id])
		@title = "Thread bearbeiten"
  end

  # POST /forum_threads
  def create
    @forum_thread = ForumThread.new(params[:forum_thread])
    @forum_thread.user = current_user
    if @forum_thread.save
      redirect_to :controller => "forum_threads", :action => "show", :id => @forum_thread, notice: 'Forum thread was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /forum_threads/1
  def update
    #@forum_thread = ForumThread.find(params[:id])
    if @forum_thread.update_attributes(params[:forum_thread])
      redirect_to :controller => "forum_threads", :action => "show", :id => params[:id], notice: 'Forum thread was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /forum_threads/1
  def destroy
    @forum_thread = ForumThread.find(params[:id])
    area_id = @forum_thread.id
		
    @forum_thread.destroy
      redirect_to :controller => "forum_areas", :action => "show", :id => area_id
  end
end
