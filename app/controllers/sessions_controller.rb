class SessionsController < ApplicationController
  def new
  end

  def create
    if User.find_by(name: params[:username])
      session[:username] = params[:username]
      redirect_to topics_path
    else
      redirect_to sign_in_path
    end
  end


  def destroy
      session[:username] = nil 
      redirect_to root_path
  end

end
