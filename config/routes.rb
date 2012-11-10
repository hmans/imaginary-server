Imaginary::Application.routes.draw do
  namespace :api do
    resources :buckets do
      resources :images
    end
  end

  get 'x/:bucket_id(/*options)/:name' => 'transforms#serve'

  # root to: 'buckets#index'
end
