FactoryBot.define do
  factory :article do
    title { "MyString" }
    ingress { "MyText" }
    body { "MyText" }
    image { "MyString" }
    written_by { "Steffe Karlberg" }
    association :category
    country { "Sweden" }
    city { "Gothenburg" }
  end
end
