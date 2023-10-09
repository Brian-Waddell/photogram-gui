Rails.application.routes.draw do 

  get("/", {:controller => "users", :action => "home"})
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:path_username", {:controller => "users", :action => "show"})
  
  
  get("/update_users/:new_username", { :controller => "users", :action => "update"})
  get("/insert_user", {:controller => "users", :action => "create"})

  
  

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:photo_path", { :controller => "photos", :action => "show"})
  post("/photos/:photo_path", { :controller => "photos", :action => "show"})
  
  get("/delete_photo/:photo_path", { :controller => "photos", :action => "delete"})
  get("/insert_photo", {:controller => "photos", :action => "create"})
  get("/update_photo/:modify_id", {:controller => "photos", :action => "update"} )

  post("/insert_comment/:photo_id", {:controller => "photos", :action => "new_comment"})
  
end
