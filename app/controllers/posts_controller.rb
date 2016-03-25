class PostsController < ApplicationController
  def index
   @posts = Post.all
   @new_post = Post.new
  end
  
  def create
   @comment = Post.new(post_params)
  end 
   
  private
	def post_params
	 params.require(:post).permit(:content)
	end
end
