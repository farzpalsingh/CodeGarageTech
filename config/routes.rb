Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'work/project-detail-ucview'=>'home#project_detail1'
  get 'work/project-detail-welcomeai'=>'home#project_detail2'
  get 'work/project-detail-markets-world'=>'home#project_detail3'
  get '/about-us'=>'home#about_us'
  get '/contact' =>'contacts#index'
  post '/contact/create' => 'contacts#create'
  get '/careers' => 'careers#index'

end
