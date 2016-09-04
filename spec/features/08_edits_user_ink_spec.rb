require 'rails_helper'

feature 'updates user ink' do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:ink) { FactoryGirl.create(:ink) }
  let!(:user_ink1) { FactoryGirl.create(:user_ink, ink: ink, user: user1) }
  let!(:user2) { FactoryGirl.create(:user) }

  context 'is not the owner of the user ink' do
    scenario 'user can not edit a user ink they do not own' do
      sign_in(user2)
      visit user_user_ink_path(user1, user_ink1)

      expect(page).to_not have_content('Edit Ink Details')
    end
  end

  context 'owns the user ink' do
    scenario 'user can edit their own ink' do
      sign_in(user1)
        visit user_user_ink_path(user1, user_ink1)
      click_on 'Edit Ink Details'

      fill_in 'Bottle Size', with: 50
      click_button 'Update User Ink'
      expect(page).to have_content(50)
    end
  end
end
