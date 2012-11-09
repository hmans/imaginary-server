class Api::BaseController < InheritedResources::Base
  http_basic_authenticate_with :name => "zomg", :password => "zomg"
end
