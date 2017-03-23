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

  def user_likes
    json_parse(conn.get '/v2.8/me/likes')[:data]
  end

  def user_friends_count
    json_parse(conn.get '/v2.8/me/friends')[:summary][:total_count]
  end

  def user_birthday
    json_parse(conn.get '/v2.3/me?fields=birthday')[:birthday]
  end

  def json_parse(user_info)
    JSON.parse(user_info.body, symbolize_names: true)
  end
end
