class Task < ActiveRecord::Base
  belongs_to :to_do_list

  validates_uniqueness_of :name, scope: :to_do_list
end
