class ImagesController < InheritedResources::Base
  respond_to :json, :xml
  belongs_to :bucket
end
