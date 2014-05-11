class SessionsController < ApplicationController
  def new
  end

  def create
    if User.authenticate(params[:username], params[:password])
      session[:username] = params[:username]
      redirect_to topics_path, notice: "Login OK"
    else
      redirect_to sign_in_path, alert: "Username or password is not ok"
    end
  end


  def destroy
      session[:username] = nil 
      redirect_to root_path
  end

end
