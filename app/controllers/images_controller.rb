class ImagesController < ApplicationController
  def index
    @images = Image.order('score').reverse_order
	@image = Image.new
	end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    image_scores = Image.order('score')
    @image.score = image_scores[-1].score + 1
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
          image_plus_one
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

  private
  def image_plus_one
    image_id = @comment.image_id
    image = Image.find(image_id)
    image.score += 1
    image.save
 end
end
