require 'rails_helper'

feature 'creates user ink' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:ink) { FactoryGirl.create(:ink) }
  let!(:user_ink) { FactoryGirl.attributes_for(:user_ink) }

  scenario 'user visits ink collection page' do

  end
end
