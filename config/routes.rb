Rails.application.routes.draw do
  resources :packages, only: :index do
    collection do
      get :enqueu_crawlers
    end
  end
end
