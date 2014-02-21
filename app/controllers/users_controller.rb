class UsersController < ApplicationController
  
  layout false
  def index
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @user = User.new({:name => "Taylor"})
  end

  def edit
  end

  def delete
  end

  def create
  # Instantiate a new object using form parameters
    @user = User.new(user_params)
  # Save the object
    if @user.save
  # If the save succeeds, redirect to the index action
      flash[:notice] = "User Created Successfully!"
      redirect_to(:controller => 'events', :action => 'index')
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
