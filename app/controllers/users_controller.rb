class UsersController < ApplicationController
  # What does this do?
  # before_action :authorize, only: [:show, :edit]
  def index
  end

  def show
    # if user doesn't exist redirect_to root
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @story = Story.where(:user_id => @user.id)
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # make email downcase in database
    @user.email = @user.email
    @user.email = @user.email.downcase
    if @user.save
      session[:user_id] = @user.id
      redirect_to stories_path
    else
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
