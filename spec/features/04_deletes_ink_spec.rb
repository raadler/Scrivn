require 'rails_helper'

feature 'user deletes ink' do
  let!(:ink) { FactoryGirl.create(:ink) }
  let!(:another_ink) { FactoryGirl.create(:ink) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, admin: true)}

  scenario 'non-admin cannot delete ink' do
    sign_in(user)

    visit ink_path(ink)
    expect(page).to_not have_link('Delete Ink')
  end

  scenario 'admin successfully deletes ink' do
    sign_in(admin)

    visit ink_path(ink)
    click_link('Delete Ink')

    expect(current_path).to eq(inks_path)
    expect(page).not_to have_content(ink.color_name)
    expect(page).to have_content(another_ink.color_name)

    expect(Ink.all.count).to eq(1)
  end
end
