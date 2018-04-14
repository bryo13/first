Rails.application.routes.draw do
 resources :assignments
 root 'assignments#index'
end
