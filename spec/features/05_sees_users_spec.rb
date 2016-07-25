require 'rails_helper'

feature 'sees user' do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario 'visits user profile page' do
    sign_in(user1)
    visit user_path(user2)
    expect(page).to have_content(user2.username)
  end
end
