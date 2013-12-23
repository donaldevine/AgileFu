class Sprint < ActiveRecord::Base
  attr_accessible :description, :end_date, :position, :priority, :project_id, :sprint_review, :start_date

  # Relationships
  belongs_to :project 		# Project can have many sprints
  has_many :tasks # Sprint can have many tasks

  # Input validation
  validates_presence_of :description
end
