Imaginary::Application.routes.draw do
  resources :buckets, format: :json do
    resources :images, format: :json
  end

  # root to: 'buckets#index'
end
