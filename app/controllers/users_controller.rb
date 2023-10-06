class UsersController < ApplicationController

  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})
    render({:template => "/users_templates/index"})
  end
  def show
    input_username = params.fetch("path_username")
    matching_username = User.where({ :username => input_username})
    the_user = matching_username.first

    render({:template => "/users_templates/show"})
  end 

end 
