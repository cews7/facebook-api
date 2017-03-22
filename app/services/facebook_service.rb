class FacebookService
  attr_reader :user_token, :conn
  def initialize(user)
    @user_name  = user.name
    @image      = user.image
    @user_token = user.oauth_token
    @conn       = Faraday.new(url: 'https://graph.facebook.com') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params[:access_token] = user_token
    end
  end

  def user_image
    @image
  end
end
