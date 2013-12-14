class Story < ActiveRecord::Base
  attr_accessible :best_case_estimate, :description, :priority, :project_id, :title, :worst_case_estimate

  belongs_to :project 		# Project can have many stories

  has_many :tasks 			# Story can have many tasks

end
