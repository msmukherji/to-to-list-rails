Rails.application.routes.draw do

  devise_for :users
  root 'application#home'

  get 'lists/:id' => 'to_do_lists#show', as: 'lists'

  get 'lists'     => 'to_do_lists#show_all', as: 'all_unfinished' 

  get 'new_list'  => 'to_do_lists#new_list', as: 'to_do_lists'

  post '/'  => 'to_do_lists#new_list'

  post 'new_list' => 'to_do_lists#add_list'

  patch 'new_list' => 'to_do_lists#add_list'

  get '/lists/:id/new_task' => 'tasks#new_task', as: 'tasks'

  patch '/lists/:id/new_task' => 'tasks#add_task'

  post '/lists/:id/new_task' => 'tasks#add_task'
  
  patch 'lists/tasks/:id' => 'tasks#done', as: 'list_tasks'
  #WHICH ONE OF THE ABOVE IS DOING SOMETHING?  
  #WHY DOES IT SAY NO POST ROUTE WHEN I HAVE PATCH AND NO PATCH ROUTE WHEN I HAVE POST?
  
  get 'lists/:id/edit' => 'to_do_lists#edit', as: 'to_do_list'

  patch 'lists/:id/edit' => 'to_do_lists#update'

  get 'tasks/:id' => 'tasks#edit', as: 'edit_task'

  patch 'tasks/:id' => 'tasks#update', as: 'task'

  patch 'tasks/:id/delete' => 'tasks#delete', as: 'delete_task'

  get 'random' => 'tasks#random'

  get 'search' => 'tasks#new_search'

  post 'search' => 'tasks#search'

  patch 'lists/:id/delete' => 'to_do_lists#delete', as: 'delete_list'
end
