class PostsController < ApplicationController
  def index
    @posts = Post.order('score').reverse_order
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    post_scores = Post.order('score')
    @post.score = post_scores[-1].score + 1
    if @post.save
      flash[:success] = "The post was added"
      redirect_to root_path
    else 
      render 'index'
    end
  end
  
  def create_comment	
	@comment = Comment.new(comment_params)
	if @comment.save
	  flash[:success] = "The post was added!"
	  @page_id = @comment.image_id
          post_plus_one
	  redirect_to :back
	else
	 render 'index'
	end
  end
  
  def threads
   @posts = Post.find(params[:id])
   @comments = Comment.where(:image_id => params[:id]) 
   @comment = Comment.new
  end
    
  private 
  
  def post_params
    params.require(:post).permit(:image, :title, :opening_post)
  end
  
  def comment_params
    params.require(:comment).permit(:content).merge(:image_id => params[:id])
  end

  private
  def post_plus_one
    post_id = @comment.image_id
    post = Post.find(image_id)
    post.score += 1
    post.save
 end
end
