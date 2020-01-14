Rails.application.routes.draw do
  resources :todos
  devise_for :users, :controllers => { :registrations => "registrations" }
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'todos#index'


  devise_scope :user do
  	get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
  	get 'signup', to: 'devise/registrations#new'
  end

  resources :todos do
    collection do 
      get 'todos/new_task' => 'todos#new_task', :as => :new_task
      post 'todos/edit_task' => 'todos#edit_task', :as => :edit_task
    end
  end
  
  post 'close', to:'todos#close'

end
