Mystore::Application.routes.draw do
  resources :users
  resources :stores
  resources :items
  resources :assets
  
  root :to => "stores#home"

  resource :session, :only => [:new, :create, :destroy]

  match 'signup' => 'users#new', :as => :signup

  match 'register' => 'users#create', :as => :register

  match 'login' => 'sessions#new', :as => :login

  match 'logout' => 'sessions#destroy', :as => :logout

  match '/activate/:activation_code' => 'users#activate', :as => :activate, :activation_code => nil

  match '/admin' => 'admins#index', :as => :admin_index

  match '/admin/active' => 'admins#active', :as => :active

  match '/admin/inactive' => 'admins#inactive', :as => :inactive

  match 'show-item' => "stores#show_item" , :as => :show_item
  
  match 'show-store-item' => "stores#show_store_item" , :as => :show_store_item

  match 'add_to_cart' =>'stores#add_to_cart' , :as => :add_to_cart

  match 'show-cart' => 'stores#show_cart' , :as => :show_cart

  match 'remove-item/:id' =>'stores#remove_cart' , :as => :remove_cart

  match 'empty-cart' =>'stores#empty_cart' , :as => :empty_cart

  match 'update-cart' => 'stores#update_cart' , :as => :update_cart

  match 'new-address' =>'stores#new_address' , :as => :new_address

  match 'paypal'   =>'stores#paypal' ,:as => :paypal

  match 'indexpaypal'   =>'stores#indexpaypal' ,:as => :indexpaypal

  match 'payment-status' => 'stores#payment_status' , :as => :payment_status

  match 'payment-success' => 'stores#payment_success' , :as => :payment_success

  match 'payment-error' => 'stores#payment_error' , :as => :payment_error

  match 'all-charity' => 'stores#all_charity' , :as => :all_charity

  match 'all-club' => 'stores#all_club' , :as => :all_club





  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
