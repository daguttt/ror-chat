FactoryBot.define do
  factory :prompt do
    name { "Untitled" }
    content { "This is a demo content" }
    processed_in_job { false }
  end
end
