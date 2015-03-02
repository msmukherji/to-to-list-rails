class ToDoList < ActiveRecord::Base
  has_many :tasks
end