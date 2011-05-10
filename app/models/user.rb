class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :token_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :authentication_token

  
  has_many :contexts
  has_many :projects
  has_many :poms
  has_many :tasks
  
  
  ROLES = %w[admin user disabled banned]
  
  before_create :set_default_role
#  before_create :ensure_authentication_token

  after_create :setup_default_data
  
  def set_default_role
    self.role = "user"
  end
  
  
  def setup_default_data
#     # Interaction Types
#     ["Phone Call", "Hang Out", "Breakfast", "Lunch", "Dinner", "IM/Text", "Meeting", "Email", "Tweet"].each do |type|
#       InteractionType.create!(:name => type, :user_id => self.id, :points => 1)
#     end
#     
#     # Frequencies
#     Frequency.create!(:user_id => self.id, :name => "Daily", :number_of_days => 1)
#     Frequency.create!(:user_id => self.id, :name => "Weekly", :number_of_days => 7)
#     Frequency.create!(:user_id => self.id, :name => "Monthly", :number_of_days => 30)
#     Frequency.create!(:user_id => self.id, :name => "Bi-Monthly", :number_of_days => 60)
#     Frequency.create!(:user_id => self.id, :name => "Quarterly", :number_of_days => 90)
#     Frequency.create!(:user_id => self.id, :name => "Yearly", :number_of_days => 365)  
  end
    
  
  def pom_length_in_minutes
    25
  end
    
  def current_pom
    poms.datetime_before(Time.now).datetime_after(Time.now - pom_length_in_minutes.minutes).order("datetime desc").first
  end
  
  def next_pom
    poms.datetime_after(Time.now).order("datetime desc").first
  end
  
  
#   def ensure_authentication_token
#     reset_authentication_token! if authentication_token.blank?
#   end
  
end