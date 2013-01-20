Imaginary::Application.routes.draw do
  get 'x/:bucket_id(/*options)/:name' => 'transforms#serve'

  resources :buckets do
    resources :images
  end

  root to: 'transforms#welcome'
end
