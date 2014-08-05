class RenameIndexToPositionInTask < ActiveRecord::Migration
  def change
    rename_column :tasks, :index, :position
  end
end
