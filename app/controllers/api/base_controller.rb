class Api::BaseController < InheritedResources::Base
  http_basic_authenticate_with :name => ENV['IMAGINARY_API_USERNAME'], :password => ENV['IMAGINARY_API_PASSWORD']
end
