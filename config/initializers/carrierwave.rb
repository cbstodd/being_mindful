CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AWS_ACCESS_KEY_ID',                        # required
    :aws_secret_access_key  => 'AWS_SECRET_ACCESS_KEY',
    :region                 => 'us-east-1',
    :host                   => 'being-mindful.herokuapp.com',
    :endpoint               => 'beingmindful-posts.s3-website-us-east-1.amazonaws.com'

  }
  config.cache_dir = "#{Rails.root}/tmp/"
  config.fog_directory  = 'beingmindful-posts'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  config.storage = :fog
end