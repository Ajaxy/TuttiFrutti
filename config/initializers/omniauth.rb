# encoding: utf-8
config = YAML.load_file(File.join(Rails.root, 'config', 'omniauth.yml'))[Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, config['vkontakte']['app_id'], config['vkontakte']['secret'], :display => 'popup'
  provider :facebook , config['facebook' ]['app_id'], config['facebook' ]['secret'], :display => 'popup'
end

unless Rails.env.production?
  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  }
end
