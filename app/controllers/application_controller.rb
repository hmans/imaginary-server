class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :transform_url

  def transform_url(image, commands = nil)
    url = ['x', image.bucket.name, commands, image.name].compact.join('/')

    if image.bucket.secret.present?
      signature_string = "#{url}/#{image.bucket.secret}"
      url << "-#{Digest::SHA1.hexdigest(signature_string)[0..15]}"
    end

    '/' + url
  end
end
