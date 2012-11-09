Imaginary::Application.routes.draw do
  resources :images

  resources :buckets
  # root to: 'buckets#index'
end
