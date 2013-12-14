class Sprint < ActiveRecord::Base
  attr_accessible :description, :end_date, :position, :priority, :project_id, :sprint_review, :start_date

  belongs_to :project 		# Project can have many sprints

end
