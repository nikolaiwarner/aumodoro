class Project < ActiveRecord::Base

  belongs_to :user
  belongs_to :context
  has_many :tasks
#  has_many :poms
  
  validates :name, :presence => true, :uniqueness => {:scope => :user_id}  
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
  def self.find_by_slug name_slug
    Project.find(name_slug.split('-').first)
  end
  
  def self.random for_user
    offset = rand(Project.where(:user_id => for_user.id).count)
    Project.first(:offset => offset)
  end
    
  def pom_count
    poms = 0
    tasks.each do |task|
      poms = poms + task.poms.count
    end
    poms
  end
    
  def default_color
    thecolor = color
    thecolor ||= context.default_color if context  
  end
  
  def percent_complete_estimate
    total_pom_estimate ||= 0
    (total_pom_estimate != 0) ? ("%0.1f" % [100.0 * pom_count/total_pom_estimate]) : 0
  end
  
  def self.priorities
    {"Normal" => 2, "Low" => 3, "High" => 1}
  end
  
end
