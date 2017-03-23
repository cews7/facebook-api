require 'rails_helper'

describe 'Facebook Service' do
  context '#user_likes' do
    it 'retrieves user likes' do
      VCR.use_cassette("user_likes") do

        user = OpenStruct.new(
          name: 'Eric Wahlgren-Sauro',
          oauth_token: ENV['FACEBOOK_TOKEN']
        )

        user_likes = FacebookService.new(user).user_likes

        expect(user_likes).to be_an(Array)
        expect(user_likes.first[:name]).to eq 'Center for Service and Sustainability'
        expect(user_likes.last[:name]).to eq 'Prince of Persia'
      end
    end
  end

  context '#user_friends_count' do
    it 'retrieves user friends count' do
      VCR.use_cassette("user_friends_count") do

        user = OpenStruct.new(
          name: 'Eric Wahlgren-Sauro',
          oauth_token: ENV['FACEBOOK_TOKEN']
        )

        user_friends_count = FacebookService.new(user).user_friends_count

        expect(user_friends_count.class).to eq Fixnum
        expect(user_friends_count).to eq 494
      end
    end
  end

  context '#user_birthday' do
    it 'retrieves user birthday' do
      VCR.use_cassette("user_birthday") do

        user = OpenStruct.new(
          name: 'Eric Wahlgren-Sauro',
          oauth_token: ENV['FACEBOOK_TOKEN']
        )

        user_birthday = FacebookService.new(user).user_birthday

        expect(user_birthday.class).to eq String
        expect(user_birthday).to eq "10/30/1993"
      end
    end
  end
end
