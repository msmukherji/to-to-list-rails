class AddUserColumnToLists < ActiveRecord::Migration
  def change
    add_column :to_do_lists, :user_id, :integer
  end
end
