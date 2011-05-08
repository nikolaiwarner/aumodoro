class UsersController < ApplicationController
  load_and_authorize_resource

  before_filter :set_section
  def set_section
      @section_name = 'account'
  end
  
  
  def settings
    @user = current_user
  end
  
end