CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],       # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],       # required
    :region                 => 'us-west-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'hdseattle'                     # required
  #  config.fog_public     = false
  #  config.cache_dir = "#{Rails.root}/tmp/uploads"
  #  config.fog_public     = false                                   # optional, defaults to true
  #  config.fog_attributes = {"Content-Disposition" => "attachment;"}  # optional, defaults to {}
  #  config.asset_host     = 'https://assets.example.com'            # optional, defaults to nil
end
