class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.integer :project_id
      t.text :description
      t.date :start_date
      t.date :end_date
      t.text :sprint_review
      t.integer :priority
      t.integer :position

      t.timestamps
    end
  end
end
