Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'cocktails#index'
  resources :cocktails , only: [:show, :index, :new, :create] do
    resources :doses, only: [:new, :create, :destroy]
  end
end
