class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :company, :firstname, :lastname, :linkedin_account, :mobile, :phone, :website, :user_id
end
