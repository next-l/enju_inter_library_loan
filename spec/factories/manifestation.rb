FactoryGirl.define do
  factory :manifestation do |f|
    f.sequence(:original_title){|n| "manifestation_title_#{n}"}
  end
end
