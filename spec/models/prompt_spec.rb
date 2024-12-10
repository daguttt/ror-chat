require 'rails_helper'

RSpec.describe Prompt, type: :model do
  it "increments a counter for untitled prompts" do
    create(:prompt)
    prompt_2 = create(:prompt)
    untitled_prompts_count = Prompt.where("name LIKE 'Untitled%'").count
    expect(prompt_2.name).to eq("Untitled #{untitled_prompts_count}")
  end
end
