class ImagesController < InheritedResources::Base
  respond_to :json, :xml
  belongs_to :bucket

  def serve
    @bucket = Bucket.find(params[:bucket_id])
    @image = @bucket.images.find_by_name!(params[:name])
    render text: @image.image.data, content_type: 'image/jpeg'
  end
end
