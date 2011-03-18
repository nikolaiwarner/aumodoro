class Pom < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :project

  def default_color
    default_color = group.default_color if group
    default_color ||= project.default_color
    default_color ||=  "#000"
  end
    
end
