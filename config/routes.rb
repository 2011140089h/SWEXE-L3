Rails.application.routes.draw do
  get 'tweets/index'=>"tweets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tweets#index"
  get "root_path"=>"tweets#index"
  get "new_tweet_path"=>"tweets#new"
  post "new_tweet_path"=>"tweets#create"
  delete "delete_path/:id"=>"tweets#destroy"
  get ":id/edit_tweet_path"=>"tweets#edit"
  patch ":id/edit_tweet_path"=>"tweets#update"
end

