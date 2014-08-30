class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    fail
    if @post.save 
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end 
  end
  #
  # def destroy
  #   @post = Post.find_by_id(params[:id])
  #   @post.destroy
  #   redirect_to sub_url(@post.sub)
  # end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = current_user.posts.find(params[:id]) 
    @post.author_id = current_user.id
    render :edit
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to sub_url(@post.sub)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def new
    @subs = Sub.all 
    @post = Post.new
  end
  
  protected 
  
  def post_params
    params.require(:post).permit(:title, :content, :author_id, :sub_id => [])
  end
end
