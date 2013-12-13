class Project < ActiveRecord::Base
  attr_accessible :description, :name, :target_completion_date, :target_start_date

  has_many :product_backlogs
end
