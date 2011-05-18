class UsersController < ApplicationController
  authorize_resource

  before_filter :set_section
  def set_section
      @section_name = 'account'
  end
  
  
  def index
    @users = User.order('created_at DESC')
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def settings
    @user = current_user
  end
  
  
  def update
    current_user.update_attributes(params[:user])
    redirect_to :action => 'settings'
  end
  
end