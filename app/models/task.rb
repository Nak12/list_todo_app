class Task < ApplicationRecord
  validates :task_title, presence: true, length: {minimum: 3, maximum: 50}

  belongs_to :list
end