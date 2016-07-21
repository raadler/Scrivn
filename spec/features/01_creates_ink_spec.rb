require 'rails_helper'

feature 'creates ink' do
  let!(:my_ink) { FactoryGirl.attributes_for(:ink) }
  scenario 'visits new ink form' do
    visit inks_path
    click_link 'Add New Ink'
    expect(current_path).to eq(new_ink_path)
    expect(page).to have_selector('form')
    expect(page).to have_content('Color Name')
    expect(page).to have_content('Line')
    expect(page).to have_content('Manufacturer')
    expect(page).to have_content('Description')
  end
  scenario 'inputs a valid ink' do
    visit inks_path
    click_link 'Add New Ink'
    fill_in 'Color Name', with: my_ink[:color_name]
    fill_in 'Line', with: my_ink[:line]
    fill_in 'Manufacturer', with: my_ink[:manufacturer]
    fill_in 'Description', with: my_ink[:description]
    click_button 'Create Ink'

    expect(current_path).to eq("/inks/#{Ink.first.id}")
    expect(page).to have_content('Ink successfully added!')
    expect(page).to have_content(my_ink[:name])
  end
  scenario 'does not comeple required fields' do
    visit inks_path
    click_link 'Add New Ink'
    fill_in 'Color Name', with: my_ink[:color_name]
    fill_in 'Line', with: my_ink[:line]
    fill_in 'Description', with: my_ink[:description]
    click_button 'Create Ink'

    expect(page).to have_content("Manufacturer can't be blank")
    expect(page).not_to have_content('Ink successfully added!')
    expect(find('#ink_color_name').value).to eq(my_ink[:color_name])
  end
end
