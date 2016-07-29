Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :quotes
  root 'quotes#random'
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
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
