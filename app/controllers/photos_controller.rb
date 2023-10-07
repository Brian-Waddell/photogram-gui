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

  def delete 
     the_id = params.fetch("photo_path")
     matching_photos = Photo.where({ :id => the_id})
     the_pic = matching_photos.first

     the_pic.destroy

  redirect_to("/photos")
  end 

  def create 

  input_image = params.fetch("image_query")
  input_caption = params.fetch("caption_query")
  input_owner_id = params.fetch("owner_query")

  new_photo = Photo.new 
  new_photo.image = input_image 
  new_photo.caption = input_caption 
  new_photo.owner_id = input_owner_id 

  new_photo.save


    redirect_to("/photos/" +new_photo.id.to_s)
  end 

end
