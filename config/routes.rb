Rails.application.routes.draw do
	root 'api/heros#index'

  namespace :api, format: :json do
    resources :heros do
      member do
        get '/abilities', to: 'heros#abilities'
      end
    end
    resources :abilities
  end

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
