FactoryBot.define do
  factory :manifestation do |f|
    f.sequence(:original_title){|n| "manifestation_title_#{n}"}
    f.carrier_type_id{CarrierType.find(1).id}
    f.content_type_id{ContentType.find(1).id}
    f.frequency_id{Frequency.find(1).id}
  end
end
