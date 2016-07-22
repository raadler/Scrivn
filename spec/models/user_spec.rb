require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      username: 'CalligraphyPuffin',
      email: 'puffin@gmail.com',
      encrypted_password: 'inkisawesome'
    )
  end

  it { is_expected.to have_valid(:username).when('sadusername') }
  it { is_expected.to_not have_valid(:username).when(nil, '') }
  it { expect(user).to validate_uniqueness_of(:username) }

  it { is_expected.to have_valid(:email).when('sad@gmail.com') }
  it { is_expected.to_not have_valid(:email).when(nil, '') }
  it { expect(user).to validate_uniqueness_of(:email) }

  it { is_expected.to have_valid(:encrypted_password).when('123456') }
  it { is_expected.to_not have_valid(:encrypted_password).when(nil, '') }
end
