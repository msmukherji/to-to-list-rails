class ToDoList < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  validates_uniqueness_of :name, scope: :user
end