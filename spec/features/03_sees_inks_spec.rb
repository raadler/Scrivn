require 'rails_helper'

feature 'sees inks' do
  scenario 'sees all the inks' do
    ink_1 = FactoryGirl.create(:ink, color_name: 'Black Swan in Australian Roses')
    ink_2 = FactoryGirl.create(:ink, color_name: 'Black Swan in English Roses')
    ink_3 = FactoryGirl.create(:ink, color_name: 'Berning Red')

    visit inks_path

    expect(page).to have_content('Inks')

    expect(page).to have_content(ink_1.color_name)
    expect(page).to have_selector('.name', count: 3)

    expect(page).to have_link(ink_1.color_name)

    expect(page).to have_content(ink_1.color_name)
    expect(page).to have_content(ink_2.color_name)
    expect(page).to have_content(ink_3.color_name)
  end
  scenario 'sees no inks' do
    visit inks_path

    expect(page).not_to have_selector('.ink')
  end

end
