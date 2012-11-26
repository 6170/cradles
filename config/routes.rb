Cradles::Application.routes.draw do
  root :to => 'home#index'
  devise_for :teachers
  devise_for :volunteers
  resources :teachers
  resources :volunteers do
    collection do
      get 'profile'
      post 'update_profile'
    end
  end
end
