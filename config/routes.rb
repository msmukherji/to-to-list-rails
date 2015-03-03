Rails.application.routes.draw do

  root 'application#home'

  get 'lists/:id' => 'to_do_lists#show', as: 'lists'

  get 'lists'     => 'to_do_lists#show_all', as: 'all_unfinished' 

  get 'new_list'  => 'to_do_lists#new_list', as: 'to_do_lists'

  post '/'  => 'to_do_lists#new_list'

  post 'new_list' => 'to_do_lists#add_list'

  patch 'new_list' => 'to_do_lists#add_list'
  #get '/new_task' => 'to_do_lists#new_task', as: 'new_task'

  get '/lists/:id/new_task' => 'to_do_lists#new_task', as: 'tasks'

  patch '/lists/:id/new_task' => 'to_do_lists#add_task'

  post '/lists/:id/new_task' => 'to_do_lists#add_task'
  #WHICH ONE OF THE ABOVE IS DOING SOMETHING?  
  #WHY DOES IT SAY NO POST ROUTE WHEN I HAVE PATCH AND NO PATCH ROUTE WHEN I HAVE POST?
  
  #post '/add_task' => 'to_do_lists#add_task'

  #post 'lists/:id'=> 'to_do_lists#add_task', as: 'add_task'

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
