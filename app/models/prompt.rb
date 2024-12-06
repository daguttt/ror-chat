class Prompt < ApplicationRecord
  has_one :response

  before_save :modify_default_name

  validates :name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { minimum: 5, maximum: 10000 }

  attribute :name, :string, default: "Untitled"
  attribute :processed_in_job, :boolean, default: false

  def modify_default_name
    return unless self.name == "Untitled"

    prompts_untitled = self.class.where("name LIKE 'Untitled%'").count
    self.name = "Untitled #{prompts_untitled + 1}" if self.name == "Untitled"
  end
end
