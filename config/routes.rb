Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      patch :increment
      patch :clear
    end
  end

  resources :life_events

  get 'import_csv', to: 'users#import_csv'
  patch 'import_csv', to: 'users#update_csv'
  get 'import_csv2', to: 'users#import_csv2'
  patch 'import_csv2', to: 'users#update_csv2'

  get 'chart_fun', to: 'users#chart_fun'

  get 'calendar_test', to: 'users#calendar_test'
  get 'my_calendar_test', to: 'users#my_calendar_test'

  root 'users#index'
end
