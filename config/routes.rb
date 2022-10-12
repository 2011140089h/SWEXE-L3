Rails.application.routes.draw do
  get 'tweets/index'=>"tweets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tweets#index"
  get "/"=>"tweets#index"
  get "new_tweet"=>"tweets#new"
  post "new_tweet"=>"tweets#create"
  delete "delete/:id"=>"tweets#destroy"
  get ":id/edit_tweet"=>"tweets#edit"
  patch ":id/edit_tweet"=>"tweets#update"
  get "login"=>"tweets#login"
end

