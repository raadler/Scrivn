require 'rails_helper'

describe Pen do
  it { should have_valid(:name).when('Retro Pop') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:manufacturer).when('Pilot') }
  it { should_not have_valid(:manufacturer).when(nil, '') }

  it { should have_valid(:description).when('It writes like a boss')}

  it { should have_valid(:line).when('Metropolitan') }

  it { should have_valid(:filling_mechanism).when('cartridge converter')}
end
