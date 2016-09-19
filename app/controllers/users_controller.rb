class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new({name: params[:user][:name], email: params [:user][:email]})
    if @user.save
      redirect_to stories_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
