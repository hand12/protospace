CarrierWave.configure do |config|
    config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'us-east-1'
  }

    case Rails.env
    when 'development'
        config.storage = :fog
        config.fog_directory  = 'upload-protospace2'
        config.asset_host = 'https://s3.amazonaws.com/upload-protospace2'
    when 'production'
        config.storage = :fog
        config.fog_directory  = 'upload-protospace2'
        config.asset_host = 'https://s3.amazonaws.com/upload-protospace2'
    when 'test'
        config.storage = :file
        config.enable_processing = false
    end
end
