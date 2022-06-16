class Task < ApplicationRecord
  belongs_to :manager, class_name: 'User'
  has_many :assignments
  validates :name, :manager,:expected_end_date, :capacity, presence: true
end
