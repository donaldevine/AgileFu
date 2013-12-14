class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.integer :project_id
      t.integer :priority
      t.integer :best_case_estimate
      t.integer :worst_case_estimate

      t.timestamps
    end
  end
end
