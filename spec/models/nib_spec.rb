require 'rails_helper'

describe Nib do
  it { should have_valid(:nib_size).when('medium') }

  it { should have_valid(:nib_type).when('oblique') }
  it { should_not have_valid(:nib_type).when(nil, '') }
end
