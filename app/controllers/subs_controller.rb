class SubsController < ApplicationController
  
  def new
    @sub = Sub.new
    # make new.html.erb
    render :new
  end
  
  def create
    # @sub = Sub.new(sub_params)
    # @sub.author_id = current_user.id
    @sub = current_user.subs.new(sub_params)
    
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new 
    end
  end
  
  def update 
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end
  
  def edit
    @sub = Sub.find(params[:id])
  end
  
  def show
    @sub = Sub.find(params[:id])
    render :show
  end
  
  def index
  end
  
  def sub_params
    params.require(:sub).permit(:description, :title, :author_id)
  end
  
end
