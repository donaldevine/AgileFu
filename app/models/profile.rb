class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :company, :firstname, :lastname, :linkedin_account, :mobile, :phone, :website, :user_id

  # Input validation
  validates_presence_of :firstname, :lastname
end
