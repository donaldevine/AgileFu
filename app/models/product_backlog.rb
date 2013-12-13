class ProductBacklog < ActiveRecord::Base
  attr_accessible :description, :iteration, :priority, :reason, :title

  belongs_to :project

  validates_presence_of :title, :description
end
