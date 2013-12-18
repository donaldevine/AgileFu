class Sprint < ActiveRecord::Base
  attr_accessible :description, :end_date, :position, :priority, :project_id, :sprint_review, :start_date

  # One to many relationship configuration
  belongs_to :project 		# Project can have many sprints

  # Input validation
  validates_presence_of :description, :start_date
end
