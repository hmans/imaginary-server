Imaginary::Application.routes.draw do
  namespace :api do
    resources :buckets do
      resources :images
    end

    match '/' => redirect('/api/buckets')
  end

  get 'x/:bucket_id(/*options)/:name' => 'transforms#serve'

  root to: 'transforms#welcome'
end
