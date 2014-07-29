class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :mailchimp_list_uid

      t.timestamps
    end
  end
end
