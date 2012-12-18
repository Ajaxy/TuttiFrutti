# encoding: utf-8

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :vkontakte, "3304189", "EaR3uNBqo1f7QXpdps7X", display: "popup"
  provider :facebook, "317434528372827", "4c13d36e4f7fe07ca373c40e64953ba8", display: "popup"
end
