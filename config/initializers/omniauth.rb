# encoding: utf-8
config = YAML.load_file(File.join(Rails.root, 'config', 'omniauth.yml'))[Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :vkontakte, config['vkontakte']['app_id'], config['vkontakte']['secret']
  provider :facebook , config['facebook' ]['app_id'], config['facebook' ]['secret']
end
