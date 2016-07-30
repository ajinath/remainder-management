Rails.application.routes.draw do
  
  resources :members
  devise_for :admins, :controllers => { :registrations => "admin/registrations"}
  devise_for :users ,:controllers => { :registrations => "registrations" }
  
  resources :templates
  resources :groups do
    member do
      get 'remainders'
    end
  end
  
  get "mass_sms/import_csv" => "members#import_csv"
  resources :members do 
    collection do
      post :import
    end
  end
  
  namespace :admin do
    get "/profile" => "pages#profile"
    resources :users, only: [:index, :show, :destroy] do
      member do
        get :approve
        get :reject
      end 
    end
    resources :admin, only: [:update_profile] do 
      put :update_profile, on: :member, as: :update_profile
    end
    resources :groups, only: [:index] do 
      member do
        get :approve
        get :reject
      end 
    end
  end

  get '/admin' => 'admin/pages#index'
  get '/home' => 'pages#home'
  post "/search" => 'pages#search'

  root to: 'pages#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root to: "groups#index"

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
