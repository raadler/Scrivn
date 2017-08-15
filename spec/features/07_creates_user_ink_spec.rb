require 'rails_helper'

feature 'creates user ink' do
  let!(:my_ink) { FactoryGirl.create(:ink) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:another_user) { FactoryGirl.create(:user) }

  scenario "inauthenticated user can't add ink to collection" do
    visit ink_path(my_ink)

    expect(page).not_to have_content('Add to My Collection')
  end

  scenario 'user adds ink to collection' do
    sign_in(user)
    visit ink_path(my_ink)

    click_on 'Add to My Collection'

    expect(page).to have_content('Ink successfully added to collection!')
    expect(page).to have_content(my_ink.color_name)
    expect(page).to have_content(my_ink.manufacturer)
    expect(page).to have_content('Favorite?')
    expect(page).to have_content('Willing to Sell or Trade?')
  end
end
