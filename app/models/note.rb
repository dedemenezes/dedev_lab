class Note < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_rich_text :rich_body
  validates :title, presence: true
end
