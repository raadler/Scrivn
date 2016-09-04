require 'rails_helper'

feature 'deletes user ink' do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:ink) { FactoryGirl.create(:ink) }
  let!(:user_ink1) { FactoryGirl.create(:user_ink, ink: ink, user: user1) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario 'someone who does not own the ink cannot delete it' do
    sign_in(user2)
    visit user_path(user1)

    expect(page).to_not have_content('Delete')
  end

  scenario 'owner of the ink can delete it' do
    sign_in(user1)
    visit user_path(user1)
    click_link 'Delete'

    expect(page).to_not have_content(ink.color_name)
  end
end
