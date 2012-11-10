class Api::BucketsController < Api::BaseController
  respond_to :json, :xml

  def show
    show! { api_bucket_images_path(@bucket) }
  end
end
