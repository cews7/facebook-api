require 'rails_helper'

describe 'As a User' do
  it 'I see a click on likes from home page' do
    VCR.use_cassette("user_likes") do
      visit '/'

      expect(page.status_code).to eq 200
      expect(current_path).to eq root_path

      expect(page).to have_content("Sign in with Facebook")

      click_link 'Sign in with Facebook'

      expect(current_path).to eq root_path
      expect(page).to have_content 'Signed in as, Eric Wahlgren-Sauro!'
      expect(page).to have_content 'Sign Out'

      click_link 'Likes!'

      expect(page.status_code).to eq 200
      expect(current_path).to eq likes_path

      expect(page).to have_content "Prince of Persia"
      expect(page).to have_content "Mango Tree"
      expect(page).to have_content "Moto"
    end
  end
end
