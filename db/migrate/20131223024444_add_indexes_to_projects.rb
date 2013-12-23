class AddIndexesToProjects < ActiveRecord::Migration
  def change
  	add_index  :projects, :name
  	add_index  :projects, :description
  end
end
