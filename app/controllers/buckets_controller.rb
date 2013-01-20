class BucketsController < ResourceController
  def resource_base
    Bucket
  end

  def resource_key
    :name
  end
end
