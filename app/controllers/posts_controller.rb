class PostsController < ApplicationController
  def index
   @posts = Post.all
   @new_post = Post.new
  end
end
