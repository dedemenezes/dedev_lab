class Task < ApplicationRecord
  belongs_to :manager, class_name: 'User'
  has_many :assignments
  has_many :contributors, through: :assignments
  has_many :checklist_items, dependent: :destroy
  has_many :notes, dependent: :destroy
  validates :name, :manager, :expected_end_date, :capacity, presence: true

  def checklist_items_completed
    checklist_items.where(completed: true)
  end
end
