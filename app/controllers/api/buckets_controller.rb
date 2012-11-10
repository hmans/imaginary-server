class Api::BucketsController < Api::BaseController
  respond_to :json, :xml

  def show
    show! do |format|
      format.html { redirect_to api_bucket_images_path(@bucket) }
    end
  end
end
