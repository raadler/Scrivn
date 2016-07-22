require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
     FactoryGirl.build(:user)
  end
  let(:user) do
    User.new(
      username: 'CalligraphyPuffin',
      email: 'puffin@gmail.com',
      encrypted_password: 'inkisawesome'
    )
  end

  it { should have_valid(:username).when('sadusername') }
  it { should_not have_valid(:username).when(nil, '') }

  it { should have_valid(:email).when('sad@gmail.com') }
  it { should_not have_valid(:email).when(nil, '') }

  it { should have_valid(:encrypted_password).when('123456') }
  it { should_not have_valid(:encrypted_password).when(nil, '') }
end
