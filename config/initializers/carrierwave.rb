if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['ap-northeast-1'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['AKIA24RVOYR3BYHOK7GD'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['kebabapp3']
  end
end