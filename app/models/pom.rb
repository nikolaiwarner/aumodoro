class Pom < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :project
  
  scope :datetime_before, lambda { |time| { :conditions => ["datetime < ?", time] } }
  scope :datetime_after, lambda { |time| { :conditions => ["datetime > ?", time] } }
  

  def color
    project ? project.default_color : "#000"
  end
  
  def start_time
    datetime
  end
  
  def end_time
    datetime + user.pom_length_in_minutes.minutes
  end
  
  def seconds_elapsed
    (Time.now - datetime).to_i
  end
  
  def seconds_remaining
    user.pom_length_in_minutes.minutes.to_i - seconds_elapsed
  end

    
end
