class CreateProductBacklogs < ActiveRecord::Migration
  def change
    create_table :product_backlogs do |t|
      t.string :title
      t.text :description
      t.integer :iteration
      t.text :reason
      t.integer :priority

      t.timestamps
    end
  end
end
