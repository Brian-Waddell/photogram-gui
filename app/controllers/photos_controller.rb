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

  def new_comment 
  user_photo_id = params.fetch("photo_query")
  user_author_id = params.fetch("author_query")
  user_comment = params.fetch("comment_query")

   new_comment = Comment.new 
   new_comment.photo_id = user_photo_id 
   new_comment.author_id = user_author_id
   new_comment.body = user_comment

   new_comment.save

    redirect_to("/photos/" +new_comment.photo_id.to_s)
  end 

  def update 

    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({:id => the_id})

    the_photo = matching_photos.first 

  input_image = params.fetch("input_image")
  input_caption = params.fetch("input_caption")

  #photo_query = params.fetch("photo_query")
  #author_query = params.fetch("author_query")
  #comment_query = params.fetch("comment_query")

  
  the_photo.image = input_image 
  the_photo.caption = input_caption

  #the_photo.id = photo_query
  #the_photo.caption = comment_query
  #the_photo.owner_id = author_query 

  the_photo.save 


    #render({:template => "/photo_templates/update"})

    redirect_to("/photos/" +the_photo.id.to_s)
  end 

end
