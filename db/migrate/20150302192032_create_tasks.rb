class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :to_do_list_id, null: false
      t.boolean :completed, default: false
      t.datetime :due

      t.timestamps null: false
    end
  end
end
