class ChecklistItem < ApplicationRecord
  belongs_to :task

  # def update_status!
  #   @completed = !@completed
  # end
end
