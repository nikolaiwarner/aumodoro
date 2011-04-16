class Pom < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :project
  
  scope :datetime_before, lambda { |time| { :conditions => ["datetime < ?", time] } }
  scope :datetime_after, lambda { |time| { :conditions => ["datetime > ?", time] } }
  

  def default_color
    default_color = group.default_color if group
    default_color ||= project.default_color
    default_color ||=  "#000"
  end
  
  
  
  def seconds_elapsed
    (Time.now - datetime).to_i
  end
  
  def seconds_remaining
    user.pom_length_in_minutes.minutes.to_i - seconds_elapsed
  end

    
end
