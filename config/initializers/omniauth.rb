Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
    scope: 'email,user_birthday,user_likes,user_photos,user_friends,public_profile', display: 'popup'
end
