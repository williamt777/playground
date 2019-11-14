Rails.application.routes.draw do
  resources :users do
    member do
      patch :increment
      patch :clear
    end
  end

  root 'users#index'
end
