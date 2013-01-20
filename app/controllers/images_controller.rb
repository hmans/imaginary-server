class ImagesController < ResourceController
  def resource_base
    bucket.images
  end

  def resource_key
    :name
  end

  def bucket
    @bucket ||= Bucket.where(name: params[:bucket_id]).first!
  end

  def resource_parents
    [bucket]
  end
end
