class Story < ActiveRecord::Base
  attr_accessible :best_case_estimate, :description, :priority, :project_id, :title, :worst_case_estimate

  # Relationships
  belongs_to :project 		# Project can have many stories
  has_many :tasks 			# Story can have many tasks

  # Input validation
  validates_presence_of :description
end
