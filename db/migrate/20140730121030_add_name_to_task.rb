class AddNameToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :name, :string, null: false
  end
end
