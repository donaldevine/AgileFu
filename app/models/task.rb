class Task < ActiveRecord::Base
  attr_accessible :description, :position, :priority, :completed, :start_date, :end_date

  # Relationships
  belongs_to :sprint    # Sprint can have many tasks

  # Input validation
  validates_presence_of :description
end
