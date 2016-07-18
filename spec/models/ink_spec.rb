require 'rails_helper'

describe Ink do
  it { should have_valid(:color_name).when("Benevolent Badger Blue") }
  it { should_not have_valid(:color_name).when(nil, '') }

  it { should have_valid(:manufacturer).when("Noodler's") }

  it { should have_valid(:notes).when("I love this ink so much! I use it for everything.") }
end
