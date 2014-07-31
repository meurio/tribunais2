class AddMissionToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :mission, :string, null: false
  end
end
