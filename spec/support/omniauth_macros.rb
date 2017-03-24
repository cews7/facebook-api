module OmniauthMacros
  def mock_omniauth
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      'provider'=> 'facebook',
      'uid'=> '1471516409527902',
      'info'=> {
        'email'=> "cews7@live.com",
        "name"=>"Eric Wahlgren-Sauro",
        "image"=>"http://graph.facebook.com/v2.6/1471516409527902/picture"
      },
      "credentials"=>{
        "token"=>"#{ENV['FACEBOOK_TOKEN']}",
        "expires_at"=>1495494636,
        "expires"=>true
      },
      })
    end
  end
