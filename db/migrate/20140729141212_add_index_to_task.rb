class AddIndexToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :index, :integer, null: false
    add_index :tasks, :index, uniqueness: true
  end
end
