Agilefu::Application.routes.draw do
  devise_for :users

  get 'landing_page/index'

  #get '/faq' => 'landing#faq'
  #get '/about' => 'landing#about'

  #match '/myprofile' => 'profiles#myprofile'
  
  resources :product_backlogs, :only => [:index]

  #Nest related resources, this give a cleaner URL
  resources :projects do
  	resources :product_backlogs
    resources :sprints
    resources :stories
  end

    
  #root requests go to landing page
  root to: 'home#index'


end
