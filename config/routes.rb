Imaginary::Application.routes.draw do
  namespace :api do
    resources :buckets, format: :json do
      resources :images, format: :json
    end
  end

  get 'x/:bucket_id(/*options)/:name' => 'transforms#serve'

  # root to: 'buckets#index'
end
