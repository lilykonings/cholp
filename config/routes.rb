Rails.application.routes.draw do

  devise_for :users

  ActiveAdmin.routes(self)

  post 'prints/new' => 'prints#new'

  post 'creators/enable' => 'creators#enable'
  post 'creators/disable' => 'creators#disable'

  get 'dashboard' => 'dashboard#index'
  get 'dashboard/edit' => 'dashboard#edit'
  get 'dashboard/upload' => 'dashboard#upload'
  get 'dashboard/manage' => 'dashboard#manage'
  get 'dashboard/settings' => 'dashboard#settings'
  get 'dashboard/updates' => 'dashboard#updates'
  get 'dashboard/home_features' => 'dashboard#home_features'
  get 'dashboard/top_creators' => 'dashboard#top_creators'

  post 'dashboard/save' => 'dashboard#save'
  post 'dashboard/remove_banner' => 'dashboard#remove_banner'
  post 'dashboard/remove_icon' => 'dashboard#remove_icon'
  post 'dashboard/add_feature' => 'dashboard#add_feature'
  patch 'dashboard/settings/save' => 'dashboard#settings_save'
  get 'dashboard/remove_feature/:id' => 'dashboard#remove_feature'
  post 'dashboard/new_update' => 'dashboard#new_update'
  get 'dashboard/remove_update/:id' => 'dashboard#remove_update'
  post 'dashboard/new_home_feature' => 'dashboard#new_home_feature'
  get 'dashboard/remove_home_feature/:id' => 'dashboard#remove_home_feature'
  post 'dashboard/new_top_creator' => 'dashboard#new_top_creator'
  get 'dashboard/remove_top_creator/:id' => 'dashboard#remove_top_creator'

  get 'search' => 'search#index'
  # get 'search/creators' => 'search#people'
  get 'login' => 'login#index'
  get 'contact' => 'contact#index'
  get 'privacy' => 'privacy#index'
  get 'terms' => 'terms#index'
  get 'updates' => 'updates#index'

  post '/featured/add' => 'featured#add'
  get '/featured/:id/remove' => 'featured#remove'
  get '/featured' => 'featured#index'

  get '/:user' => 'users#show'
  get '/:user/all' => 'users#show_all'
  get '/p/:id' => 'prints#show'
  get '/p/:id/edit' => 'prints#edit'
  get '/p/:id/delete' => 'prints#delete'
  post '/p/:id/modify' => 'prints#modify'
  post '/p/:id/comment' => 'prints#comment'

  get '/:user/subscribe' => 'users#subscribe'
  get '/:user/unsubscribe' => 'users#unsubscribe'
  get '/dashboard/subscriptions' => 'dashboard#subscriptions'


  resources :searches
  resources :prints

  resource :dashboard, only: [:edit] do
    collection do
      patch 'settings_save'
    end
  end



  root 'home#index'

end
