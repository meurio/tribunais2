class AddDescriptionToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :description, :text, null: false, default: "Altere este texto para a descrição da tarefa"
  end
end
