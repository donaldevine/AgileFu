class Project < ActiveRecord::Base
  attr_accessible :description, :name, :target_completion_date, :target_start_date

  has_many :product_backlogs 	# Project can have many product backlogs
  has_many :stories 			# Project can have many stories
  has_many :sprints 			# Project can have many sprints
  
  belongs_to :user 				# User can have many projects.

  validates_presence_of :name 	# Input validation.
end
