Rails.application.routes.draw do

  get 'errors/not_found'

  get 'errors/internal_server_error'

  match "/404", :to => "errors#not_found", :via => :all

  # devise_for :admins
  devise_for :admins, :skip => [:registrations], :controllers => {confirmations: 'confirmations', sessions: 'admins/sessions' }
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :portfolios
  # resources :blogs
  get 'rooms/index'
  get 'rooms/show'=>'rooms#show'
  resources :conversations, only: [:create] do
    resources :messages, only: [:create]
  end
  # resources :conversations
  get '/work/project-detail/:id'=>'portfolios#show', as: 'portfolio_show'
  post "/work/update-project-details" =>"portfolios#update_portfolio", as: "update_project_details"
  get 'work/project-detail-ucview'=>'home#project_detail1'
  get 'work/project-detail-welcomeai'=>'home#project_detail2'
  get 'work/project-detail-markets-world'=>'home#project_detail3'
  get '/about-us'=>'home#about_us'
  get '/technologies'=>'home#technologies'
  get '/contact' =>'contacts#index'
  post '/contact/create' => 'contacts#create'
  get '/careers' => 'careers#new'
  post '/create_career'=>'careers#create'
  get '*a', :to => 'errors#not_found'  
end
