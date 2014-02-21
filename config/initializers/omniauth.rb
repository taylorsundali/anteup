# GREAT RESOURCE: https://github.com/ralphos/omniauth-facebook-example
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           :scope => 'email,user_birthday,read_stream', :display => 'popup'
end




OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1413374672244384', '4f83e9ba7a4a7ae866edd80499992cef' 
end