class PhotosController < ApplicationController

  def index 
    
    all_photos = Photo.all

    @photo_list = all_photos.order({:created_at => :desc })  

    render({ :template => "/photo_templates/index"} )
  end 

  def show 

    #photo_path => 777
    

    url_id = params.fetch("photo_path")

    matching_photos = Photo.where({:id => url_id})

    @the_photo = matching_photos.first
     

    render({:template => "/photo_templates/show"})
  end 

end
