class PostsController < ApplicationController
  def index
   @posts = Post.all
   @new_post = Post.new
  end
  
  def create
   @new_post = Post.new(post_params)
   
  private
	def post_params
	 params.require(:content).permit(:content)
end
