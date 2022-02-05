Rails.application.routes.draw do

  resources :playground_stuffs
  root 'static_pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      patch :increment
      patch :clear
    end
    resources :life_events, only: [:index, :new, :create]
  end

  resources :life_events, only: [:show, :edit, :update, :destroy]
  resources :students
  resources :journals, only: [:index, :show]
  resources :journal_entries

  resources :schools
  resources :checkpoints
  resources :goal_steps
  resources :goals

  resources :playgroundstuffs, only: [:index, :show, :edit, :update]

  get 'import_csv', to: 'users#import_csv'
  patch 'import_csv', to: 'users#update_csv'
  get 'import_csv2', to: 'users#import_csv2'
  patch 'import_csv2', to: 'users#update_csv2'

  get 'chart_fun', to: 'users#chart_fun'

  get 'calendar_test', to: 'users#calendar_test'
  get 'my_calendar_test', to: 'users#my_calendar_test'

  get 'hook', to: 'static_pages#hook'
  get 'run_hook', to: 'static_pages#run_hook'

end
