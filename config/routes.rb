Rails.application.routes.draw do
  resources :states do
    resources :cities do
      resources :forecasts
    end
  end

  # resources :cities do
  #   resources :forecasts
  # end

  # resources :forecasts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
