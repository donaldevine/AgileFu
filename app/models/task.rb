class Task < ActiveRecord::Base
  attr_accessible :description, :position, :priority, :story_id

  belongs_to :story 		# Story can have many tasks
end
