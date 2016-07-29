Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :quotes
  root 'quotes#random'
  get 'about' => 'static_pages#about'
  namespace :api do
    namespace :v1 do
      jsonapi_resources :precepts, only: [:index, :show] do
        collection do
          get :random
        end
      end
    end
  end

  devise_scope :user do
    get 'users/admin' => 'users/registrations#index'
    get 'users/access/:id' => 'users/registrations#access', as: 'get_user_access'
    patch 'users/access/:id' => 'users/registrations#access_update'
  end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
