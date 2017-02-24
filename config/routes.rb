Rails.application.routes.draw do
  get 'comments/create'

  root "cities#index"
  resources :cities, only: [:index, :show, :new, :create] do
    resources :lost_animals, except: [:destroy, :index, :update, :edit] do
      resources :comments, only: [:create]
    end
  end

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
