class ProductBacklog < ActiveRecord::Base
  attr_accessible :description, :iteration, :priority, :reason, :title

  belongs_to :project
end
