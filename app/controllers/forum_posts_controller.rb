class ForumPostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource 

  # GET /forum_posts
  def index
    @forum_posts = ForumPost.all
  end

  # GET /forum_posts/1
  def show
    @forum_post = ForumPost.find(params[:id])
  end

  # GET /forum_posts/new
  def new
    @forum_post = ForumPost.new
    @forum_post.forum_thread_id = params[:id]
  end

  # GET /forum_posts/1/edit
  def edit
    @forum_post = ForumPost.find(params[:id])
  end

  # POST /forum_posts
  def create
    @forum_post = ForumPost.new(params[:forum_post])
    @forum_post.user_id = current_user.id

    if @forum_post.save
      redirect_to :controller => "forum_threads", :action => "show", :id => @forum_post.forum_thread_id, notice: 'Forum post was successfully created.'
    else 
      render action: "new" 
    end
  end

  # PUT /forum_posts/1
  def update
    @forum_post = ForumPost.find(params[:id])

    if @forum_post.update_attributes(params[:forum_post])
      redirect_to :controller => "forum_threads", :action => "show", :id => @forum_post.forum_thread, notice: 'Forum post was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /forum_posts/1
  def destroy
    @forum_post = ForumPost.find(params[:id])
	  thread_id = @forum_post.forum_thread_id
    @forum_post.destroy

    redirect_to :controller => "forum_threads", :action => "show", :id => thread_id
  end
end
