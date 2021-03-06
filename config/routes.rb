Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  localized do
    root to: redirect('/congreso')
    namespace :v1 do
      resources :initiatives do
        resources :votes
      end
      resources :deputies, only: [:index, :show]
      get '/deputies/top' => 'deputies#top', as: :deputies_top
    end
  end
end
