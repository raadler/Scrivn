require 'rails_helper'

describe UserInk do
  it { should have_valid(:ink_id).when(2) }
  it { should_not have_valid(:ink_id).when(nil, '') }

  it { should have_valid(:user_id).when(2) }
  it { should_not have_valid(:user_id).when(nil, '') }

  it { should have_valid(:bottle_size).when(30) }
  it { should_not have_valid(:bottle_size).when('large') }
end
