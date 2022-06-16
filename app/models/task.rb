class Task < ApplicationRecord
  belongs_to :manager, class_name: 'User'
  validates :name, :manager, presence: true
end
