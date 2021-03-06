Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'teams#index'

  devise_for :users


  # Routes for the Comment resource:
  # CREATE
  get "/comments/new", :controller => "comments", :action => "new"
  post "/create_comment", :controller => "comments", :action => "create"

  # # READ
  # get "/comments", :controller => "comments", :action => "index"
  # get "/comments/:id", :controller => "comments", :action => "show"

  # # UPDATE
  # get "/comments/:id/edit", :controller => "comments", :action => "edit"
  # post "/update_comment/:id", :controller => "comments", :action => "update"

  # # DELETE
  # get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  #------------------------------

  # Routes for the Team resource:
  # CREATE
  # get "/teams/new", :controller => "teams", :action => "new"
  # post "/create_team", :controller => "teams", :action => "create"

  # READ
  get "/teams", :controller => "teams", :action => "index"
  get "/teams/:id", :controller => "teams", :action => "show_chats" , :action => "show"

  #SHOW_CHATS
  get "/teams/show_chats/:id", :controller => "teams", :action => "show_chats"
  #post "/create_team", :controller => "teams", :action => "create"



  # # UPDATE
  # get "/teams/:id/edit", :controller => "teams", :action => "edit"
  # post "/update_team/:id", :controller => "teams", :action => "update"

  # DELETE
  get "/delete_team/:id", :controller => "teams", :action => "destroy"
  #------------------------------


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
