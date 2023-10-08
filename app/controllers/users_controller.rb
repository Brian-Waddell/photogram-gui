class UsersController < ApplicationController

  def create 
  

  input_username = params.fetch("add_user")

  new_user = User.new 

  new_user.username = input_username

  new_user.save


    redirect_to("/users/<%= new_user.username %>")

  end

  def update 

    the_id = params.fetch("new_username")

    matching_users = User.where({:username => the_id})

    the_username = matching_users.first 

   input_user = params.fetch("update_username")
   
  
   the_username.username = input_user

   the_username.save 

    #render({:template => "/photo_templates/update"})

    redirect_to("/users/" +the_username.username)
  end 


  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})
    render({:template => "/users_templates/index"})
  end

  def show
    input_username = params.fetch("path_username")
    matching_username = User.where({ :username => input_username})
    
    @the_user = matching_username.first 

    

    
    render({:template => "/users_templates/show"})
    
  end 

  def home 

    redirect_to("/users")
  end 

end 
