class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :task_list, null: false, foreign_key: true
      t.boolean :complete, null: false, default: false
      t.string :description, null: false
      t.date :due_date

      t.timestamps
    end
  end
end
