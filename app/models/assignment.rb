class Assignment < ApplicationRecord
  belongs_to :task
  belongs_to :contributor, class_name: 'User', foreign_key: :contributor_id
end
