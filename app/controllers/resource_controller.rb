class ResourceController < ApplicationController
  include Resourcery::Base
  respond_to :json, :xml
  http_basic_authenticate_with :name => ENV['IMAGINARY_API_USERNAME'], :password => ENV['IMAGINARY_API_PASSWORD']
end
