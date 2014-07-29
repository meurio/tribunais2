class CreateTaskAccomplishments < ActiveRecord::Migration
  def change
    create_table :task_accomplishments do |t|
      t.integer :user_id, foreign_key: false
      t.integer :task_id

      t.timestamps
    end
  end
end
