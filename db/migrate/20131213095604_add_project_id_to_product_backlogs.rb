class AddProjectIdToProductBacklogs < ActiveRecord::Migration
  def change
    add_column :product_backlogs, :project_id, :integer
  end
end
