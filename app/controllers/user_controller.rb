class UserController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource 

  # GET /user
  def index
    @forum_areas = User.all
  end

  # GET /user/1
  def show
  end

  # GET /user/new
  def new
		
  end

  # GET /user/1/edit
  def edit
		
  end

  # GET /user/1/edit
  def edit_pass
		
  end
	
	def profil
		@title = "Profil"
		@user = User.find current_user
		#redirect_to edit_user_registration_path
	end

  def create
		#@user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: 'User was successfully created.' 
    else
      render action: "new"
    end
  end

  # PUT /user/1
  def update
		@user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  # DELETE /user/1
  def destroy
    @user.destroy
    redirect_to :action => "index", :controller => "user"
  end
end
