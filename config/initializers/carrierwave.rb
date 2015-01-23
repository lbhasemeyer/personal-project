CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  else

   config.fog_credentials = {
     :provider               => 'AWS',                        # required
     :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],                      # required
     :aws_secret_access_key  => ENV["AWS_SECRET_KEY"],                        # required
     :region                 => 'us-west-2'
   }
   config.fog_directory  = ENV["AWS_S3_BUCKET"]                          # required
   config.fog_public     = false                                        # optional, defaults to true
   config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
  end
end
