class Project < ActiveRecord::Base
  attr_accessible :description, :name, :target_completion_date, :target_start_date

  # Relationships
  has_many :product_backlogs 	# Project can have many product backlogs
  has_many :stories 			# Project can have many stories
  has_many :sprints 			# Project can have many sprints

  belongs_to :user 				# User can have many projects.

  # Input validation.
  validates_presence_of :name

  # Search static method
  # @param [String] search
  # @param [User] current_user
  # @param [:page] page
  def self.search(search, current_user, page)
    if search
      paginate :per_page => 5, :page => page,
               :conditions => ['name LIKE ? AND user_id = ?', "%#{search}%", current_user.id],
               :order => 'name'
    else
      # Using where syntax
      Project.where(:user_id => current_user.id).paginate(:per_page => 5, :page => page).order('name')

    end
  end
end
