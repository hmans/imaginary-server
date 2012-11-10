class Api::ImagesController < Api::BaseController
  respond_to :json, :xml
  belongs_to :bucket, finder: :find_by_name!
  defaults finder: :find_by_name!
end
