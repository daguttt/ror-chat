require 'rails_helper'

RSpec.describe Prompt, type: :model do
  it "increments a counter for untitled prompts" do
    Prompt.create!(name: "Untitled", content: "test1")
    prompt_2 = Prompt.create!(name: "Untitled", content: "test2")
    untitled_prompts_count = Prompt.where("name LIKE 'Untitled%'").count
    expect(prompt_2.name).to eq("Untitled #{untitled_prompts_count}")
  end
end
