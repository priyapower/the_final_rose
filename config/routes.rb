Rails.application.routes.draw do
  resources :bachelorettes, only: :show do
    get "/contestants", to: "bachelorettes/contestants#index"
  end
end
