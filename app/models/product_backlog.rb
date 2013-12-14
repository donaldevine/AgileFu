class ProductBacklog < ActiveRecord::Base
  attr_accessible :description, :iteration, :priority, :reason, :title

  belongs_to :Project 		# Project can have many product backlogs

  validates_presence_of :title, :description
end
