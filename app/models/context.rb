class Context < ActiveRecord::Base

  belongs_to :user
  has_many :projects
    
  validates :name, :presence => true, :uniqueness => {:scope => :user_id}

  def to_param
    "#{id}-#{name.parameterize}"
  end
  
  def self.find_by_slug name_slug
    Context.find(name_slug.split('-').first)
  end
  
  def default_color
    default_color ||= "#000"
  end
  
end
