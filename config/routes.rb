Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :resizers
      
    end
  end
  
end
