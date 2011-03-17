class Project < ActiveRecord::Base

  belongs_to :user
  belongs_to :group
  has_many :poms
  
  validates :name, :presence => true, :uniqueness => {:scope => :user_id}  
  
end
