class List < ApplicationRecord
  validates :list_title, presence: true, length: {minimum: 3, maximum: 30}

  belongs_to :user

  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: :all_blank

  has_many :favorites
  has_many :users, through: :favorites
end
