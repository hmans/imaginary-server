class ImagesController < ResourceController
  def resource_base
    @bucket = Bucket.where(name: params[:bucket_id]).first!
    @bucket.images
  end

  def resource_key
    :name
  end
end
