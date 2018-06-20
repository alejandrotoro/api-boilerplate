FactoryBot.define do
  factory :page_content do
    tag "h1"
    content "The Big Title"
    association(:page)
  end
end