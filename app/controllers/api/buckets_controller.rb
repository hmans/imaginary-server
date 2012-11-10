class Api::BucketsController < Api::BaseController
  respond_to :json, :xml
  defaults finder: :find_by_name!
end
