class Assignment < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :task
  belongs_to :contributor, class_name: 'User', foreign_key: :contributor_id
  validates :task, capacity: true
  validates :task, uniqueness: { scope: :contributor }

end
