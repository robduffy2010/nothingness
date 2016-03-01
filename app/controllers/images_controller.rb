class ImagesController < ApplicationController
  def index
    @images = Image.order('created_at')
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(photo_params)
    if @image.save
      flash[:success] = "The image was added"
      redirect_to root_path
    else 
      render 'new'
    end
  end
  
  private 
  
  def image_params
    params.require(:photo).permit(:image, :title)
  end
end
