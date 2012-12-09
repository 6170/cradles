Cradles::Application.routes.draw do
  root :to => 'home#index'
  devise_for :teachers
  devise_for :volunteers
  resources :teachers
  resources :search do
    collection do
      get 'autocomplete_school_names'
    end
  end
  resources :volunteers do
    collection do
      get 'profile'
      post 'update_profile'
    end
  end
  resources :conversations
  resources :messages
end
