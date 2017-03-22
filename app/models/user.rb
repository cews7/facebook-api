class User < ApplicationRecord
  def self.from_omniauth(auth)
    user = User.find_or_create_by(uid:auth["uid"])
    user.uid              = auth['uid']
    user.provider         = auth['provider']
    user.email            = auth['info']['email']
    user.name             = auth['info']['name']
    user.image            = auth['info']['image']
    user.oauth_token      = auth['credentials']['token']
    user.oauth_expires_at = auth['credentials']['expires_at']
    user.save
    user
  end
end
