class CreateTaskLists < ActiveRecord::Migration[7.0]
  def change
    create_table :task_lists do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
