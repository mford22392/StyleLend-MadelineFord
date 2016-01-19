Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :resizers
      
    end
  end

  match "*path", :to => "application#routing_error", :via => :all
  
end
