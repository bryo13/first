Rails.application.routes.draw do
 root 'about#show'
 get 'about/show'
  devise_for :users
 resources :assignments
 authenticated :user do
 root 'assignments#index'
end

end
