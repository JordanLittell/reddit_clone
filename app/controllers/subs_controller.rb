class SubsController < ApplicationController
  
  def new
    @sub = Sub.new
    # make new.html.erb
    render :new
  end
  
  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new 
    end
  end
  
  def edit
    @sub = Sub.find_by_id(params[:id])
  end
  
  def show
    @sub = Sub.find_by_id(params[:id])
    render :show
  end
  
  def index
  end
  
  def sub_params
    params.require(:sub).permit(:description, :title, :moderator_id)
  end
  
end
