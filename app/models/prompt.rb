class Prompt < ApplicationRecord
  has_one :response

  validates :name, length: { maximum: 255 }
  validates :content, presence: true, length: { minimum: 5 }

  attribute :processed_in_job, :boolean, default: false
end
