require 'clickatellsend'

Clickatellsend.config do |config|
  config.url = "http://api.clickatell.com/"
  config.user = Rails.application.secrets.clickatell['username']
  config.password = Rails.application.secrets.clickatell['password']
  config.api_id = Rails.application.secrets.clickatell['api_key']
end
