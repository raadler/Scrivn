FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Montblanc#{n}" }
    sequence(:email) { |n| "iloveinks#{n}@gmail.com" }
    password 'password'
    admin false
  end

  factory :ink do
    sequence(:color_name){ |n| "Baystate Blue #{n}" }
    manufacturer "Noodler's"
    description 'A pigmented ink that will totally destroy pens if given the chance'
    line 'Awesome Ink'
  end

  factory :user_ink do
    association :ink
    association :user
    color_family 'Blue'
    is_cartridge false
    is_bottled true
    bottle_size 89
    num_bottles 1
    favorite true
    will_sell false
  end
end
