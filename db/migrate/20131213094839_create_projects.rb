class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :target_start_date
      t.date :target_completion_date

      t.timestamps
    end
  end
end
