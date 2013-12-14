class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :story_id
      t.text :description
      t.integer :priority
      t.integer :position

      t.timestamps
    end
  end
end
