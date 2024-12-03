class Response < ApplicationRecord
  belongs_to :prompt
  enum :status, [ :pending, :completed, :failed ]
end
