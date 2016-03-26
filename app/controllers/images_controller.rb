class ImagesController < ApplicationController
  def index
    @images = Image.order('created_at')
	@image = Image.new
	end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "The image was added"
      redirect_to root_path
    else 
      render 'index'
    end
  end
  
  def create_post	
	@comment = Post.new(post_params)
	if @comment.save
	  flash[:success] = "The post was added!"
	  @page_id = @comment.image_id
	  redirect_to :back
	else
	 render 'index'
	end
  end
  
  def thread
   @images = Image.find(params[:id])
   @posts = Post.where(:image_id => params[:id]) 
   @comment = Post.new
  end
    
  private 
  
  def image_params
    params.require(:image).permit(:image, :title, :opening_post)
  end
  
  def post_params
    params.require(:post).permit(:content).merge(:image_id => params[:id])
  end
end
