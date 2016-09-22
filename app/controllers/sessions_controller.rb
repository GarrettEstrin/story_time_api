class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      # log the user in
      session[:user_id] = @user.id
      session[:return_to] ||= request.referer
      redirect_to session.delete(:return_to)
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to stories_path
  end
end
