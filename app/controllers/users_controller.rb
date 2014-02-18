class UsersController < ApplicationController
  
  layout false
  def index
    @users = User.order("username ASC")
  end

  def show
    @users = User.find(params[:id])
  end

  def new
  end

  def edit
  end

  def delete
  end
end
