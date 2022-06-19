class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :tasks_as_manager, class_name: 'Task', foreign_key: :manager_id
  has_many :tasks_as_contributor, class_name: 'Assignment', foreign_key: :contributor_id

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def self.busies(task)
    User.joins(:tasks_as_contributor).where(assignments: { task: task })
  end

  def self.available(task)
    # User.where(task: Task.second).pluck(:contributor_id).include? User.last.id
    busy_users = busies(task)
    User.all.reject { |user| busy_users.include? user }
  end
end
