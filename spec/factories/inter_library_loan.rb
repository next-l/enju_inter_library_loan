FactoryBot.define do
  factory :inter_library_loan do |f|
    f.item{FactoryBot.create(:item)}
    f.borrowing_library{FactoryBot.create(:library)}
  end
end
