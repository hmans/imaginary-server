Imaginary::Application.routes.draw do
  resources :buckets, format: :json do
    resources :images, format: :json
    get 'i/:name' => 'images#serve'
  end

  # root to: 'buckets#index'
end
