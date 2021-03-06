Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations",
                                    omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :user do
    patch 'update_password' => 'registrations#update_password'
  end

  root 'static_pages#home'

  resources :books, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :authors, only: :show
  resources :categories, only: :show
  resources :order_items, only: [:create, :destroy]

  resource :cart, only: [:show, :update, :destroy]

  resources :orders, only: [:index, :show]

  # namespace 'checkouts' do
  #   resources :addresses, only: [:edit, :update]
  #   resources :deliveries, only: [:edit, :update]
  #   resources :payments, only: [:edit, :update]
  #   resources :confirms, only: [:show, :update] do
  #     member do
  #       get :completed
  #     end
  #   end
  # end

  resources :checkout, only: [:show, :update] do
    member do
      get :completed
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
