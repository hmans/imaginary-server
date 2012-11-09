require 'dragonfly'

app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)
app.define_macro(ActiveRecord::Base, :has_image)

if Rails.env.production?
  app.datastore = Dragonfly::DataStorage::S3DataStore.new

  app.datastore.configure do |c|
    c.bucket_name = ENV['S3_BUCKET']
    c.access_key_id = ENV['S3_ACCESS_KEY_ID']
    c.secret_access_key = ENV['S3_SECRET_ACCESS_KEY']
    c.region = ENV['S3_REGION'] || 'us-east-1'
    # c.storage_headers = {'some' => 'thing'}       # defaults to {'x-amz-acl' => 'public-read'}
    # c.url_scheme = 'https'                        # defaults to 'http'
    # c.url_host = 'some.custom.host'               # defaults to "<bucket_name>.s3.amazonaws.com"
  end
end
