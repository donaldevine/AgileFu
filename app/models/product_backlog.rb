class ProductBacklog < ActiveRecord::Base
  attr_accessible :description, :iteration, :priority, :reason, :title
end
