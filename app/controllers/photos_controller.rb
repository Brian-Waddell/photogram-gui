class PhotosController < ApplicationController

  def index 
    
    all_photos = Photo.all

    @photo_list = all_photos.order({:created_at => :desc })  

    render({ :template => "/photo_templates/index"} )
  end 



end
