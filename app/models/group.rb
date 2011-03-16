class Group < ActiveRecord::Base

  belongs_to :user
  has_many :projects
    
  validates :name, :presence => true, :uniqueness => {:scope => :user_id}

end
