class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :tasks_as_manager, class_name: 'Task', foreign_key: :manager_id
  has_many :tasks_as_contributor, class_name: 'Task', foreign_key: :contributor_id

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
