class UsersController < ApplicationController
  
  layout "admin"
  def index
    @user = User.order("id, name ASC")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new({:name => "Taylor"})
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  # Find an existing object using form parameters
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
  # update the object
  # If the update succeeds, redirect to the index action
      flash[:notice] = "User Updated Successfully!"
      redirect_to(:action => 'show', :id => @user.id)
    else
      render('edit')
  # If the update fails, reload the form so the user can fix the problems
    end
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "User '#{user.name}' Deleted Successfully!"
    redirect_to(:action => 'index')
  end

  def delete
    @user = User.find(params[:id])
  end

  def create
  # Instantiate a new object using form parameters
    @user = User.new(user_params)
  # Save the object
    if @user.save
  # If the save succeeds, redirect to the index action
      flash[:notice] = "User Created Successfully!"
      redirect_to(:controller => 'users', :action => 'index')
    else
      render('new')
  # If the save fails, reload the form so the user can fix the problems
    end
  end

  private 
    def user_params
      #same as using "params[:event]", except it:
      # - raises an error if :event is not present
      # - allowes listed attributes to be mass assigned
      params.require(:user).permit(:provider, :uid, :name, :oauth_token, :oauth_expires_at, :created_at, :updated_at)      
    end


end
