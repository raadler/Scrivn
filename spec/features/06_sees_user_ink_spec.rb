require 'rails_helper'

feature 'sees user ink' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:ink) { FactoryGirl.create(:ink) }
  let!(:user_ink1) { FactoryGirl.create(:user_ink, ink: ink, user: user) }
  let!(:user2) { FactoryGirl.create(:user) }

  context 'authenticated user' do
    scenario 'visits ink collection page' do
      sign_in(user)
      visit user_path(user)

      expect(page).to have_content("#{user.username}'s Inks")
      expect(page).to have_content("#{ink.color_name}")
    end
  end

  scenario 'a different user' do
    sign_in(user2)
    visit user_path(user)

    expect(page).to have_content("#{user.username}'s Inks")
    expect(page).to have_content("#{ink.color_name}")
  end
end
