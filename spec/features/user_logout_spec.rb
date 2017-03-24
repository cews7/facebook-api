require 'rails_helper'

describe 'As a User' do
  it 'I see logout' do
      visit '/'

      expect(page.status_code).to eq 200
      expect(current_path).to eq root_path

      expect(page).to have_content("Sign in with Facebook")

      click_link 'Sign in with Facebook'

      expect(current_path).to eq root_path
      expect(page).to have_content 'Signed in as, Eric Wahlgren-Sauro!'
      expect(page).to have_content 'Sign Out'

      click_link 'Sign Out'

      expect(page.status_code).to eq 200
      expect(current_path).to eq root_path

      expect(page).to have_content("Sign in with Facebook")
  end
end
