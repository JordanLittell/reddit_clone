class SessionsController < ApplicationController
  
  def create
    @user = User.find_by_credentials(
      params[:user][:username], 
      params[:user][:password]
    )
    if @user.nil?
      @user = User.new
      flash.now[:errors] = ["incorrect credentials"]
      flash.now[:errors] << "Password can't be blank" if (params[:user][:password]) == ""
      render :new 
    else
      flash[:notice] = ["Welcome dude"]
      log_in!(@user)
      redirect_to user_url(@user)
    end
  end
  
  
  def new
    @user = User.new
    render :new
  end
  
  
  def destroy
    log_out!(current_user)
    redirect_to new_session_url
  end
  
end
