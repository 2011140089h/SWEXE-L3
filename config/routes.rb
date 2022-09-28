Rails.application.routes.draw do
  get 'tweets/index'=>"tweets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tweets#index"
  get "tweets/new"=>"tweets#new"
  post "tweets/new"=>"tweets#create"
  delete "tweets/:id"=>"tweets#destroy"
  get "tweets/:id/edit"=>"tweets#edit"
  patch "tweets/:id/edit"=>"tweets#update"
end

