Rails.application.routes.draw do
  # GET /
  root 'home#index'
  # Devise routes with custom controllers
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords' }
  # GET /users/:id
  resources :users, only: [:show] do
    # GET /users/:id/followers
    # GET /users/:id/following
    member do
      get :followers, :following
    end
  end
  # POST /follow_relationships
  # DELETE /follow_relationships/:id
  resources :follow_relationships, only: [:create, :destroy]

  patch 'update_user_professions' => 'users#update_user_professions'
  put 'update_user_professions' => 'users#update_user_professions'
  patch 'update_user_profile_pic' => 'users#update_user_profile_pic'
  put 'update_user_profile_pic' => 'users#update_user_profile_pic'

  resources :professions

  get 'typeahead_professions' => 'professions#typeahead_professions'

  get 'welcome/add_profession' => 'welcome#add_profession'
  get 'welcome/add_profile_pic' => 'welcome#add_profile_pic'
  get 'welcome/add_interests' => 'welcome#add_interests'
  get 'welcome/follow_people' => 'welcome#follow_people'

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
