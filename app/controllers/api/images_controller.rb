class Api::ImagesController < Api::BaseController
  respond_to :json, :xml
  belongs_to :bucket
end
