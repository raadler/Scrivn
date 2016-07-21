require 'rails_helper'

feature 'edits ink' do
  let!(:my_ink) { FactoryGirl.create(:ink) }
  scenario 'visits edit ink form' do
    visit edit_ink_path(my_ink)

    expect(page).to have_selector('form')
    expect(page).to have_content('Color Name')
    expect(page).to have_content('Line')
    expect(page).to have_content('Manufacturer')
    expect(page).to have_content('Description')

    expect(find('#ink_color_name').value).to eq(my_ink[:color_name])
    expect(find('#ink_line').value).to eq(my_ink[:line])
    expect(find('#ink_manufacturer').value).to eq(my_ink[:manufacturer])
    expect(find('#ink_description').value).to eq(my_ink[:description])
  end

  scenario 'successfully updates ink' do
    visit edit_ink_path(my_ink)
    fill_in 'Line', with: "Noodler's Pigmented Inks"
    click_button 'Update Ink'

    expect(page).to have_content('Ink successfully saved!')
    expect(page).to have_content("Noodler's Pigmented Inks")
  end

  scenario 'does not complete required fields' do
    visit edit_ink_path(my_ink)

    fill_in 'Manufacturer', with: ''
    click_button 'Update Ink'

    expect(page).to have_content("Manufacturer can't be blank")
    expect(page).not_to have_content('Ink successfully saved!')
    expect(find('#ink_color_name').value).to eq(my_ink[:color_name])
  end
end
