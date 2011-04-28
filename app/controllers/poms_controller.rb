class PomsController < ApplicationController
  #load_and_authorize_resource
  authorize_resource

  respond_to :html, :json

  def calendar
    @poms = Pom.where(:user_id => current_user.id).datetime_after(Time.at(params[:start].to_i).utc).datetime_before(Time.at(params[:end].to_i).utc).order('datetime ASC')
    respond_with(@poms)
  end  
  
  def index
    @poms = Pom.where(:user_id => current_user.id).order('datetime ASC').page(params[:page]).per(20)
    respond_with(@poms)
  end

  def show
    @pom = Pom.where(:user_id => current_user.id).find(params[:id])
    @contexts = current_user.contexts
    @submit_title = 'Update Pomodoro'
    respond_with(@pom)
  end


  def new
    @pom = Pom.new
    @contexts = current_user.contexts
    @submit_title = 'Start Pomodoro'
    respond_with(@pom)
  end


  def edit
    @pom = Pom.where(:user_id => current_user.id).find(params[:id])
    @contexts = current_user.contexts
    @submit_title = 'Update Pomodoro'
    respond_with(@pom)
  end


  def create
    if params[:pom]['datetime'] == 'Now'
      params[:pom]['datetime'] = Time.now
    end
    
    @pom = Pom.new(params[:pom])
    @pom.user_id = current_user.id
    
    respond_to do |format|
      if @pom.save
        format.html { redirect_to(@pom, :notice => 'pom was successfully created.') }
        format.xml  { render :xml => @pom, :status => :created, :location => @pom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pom.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @pom = Pom.find(params[:id])
    @pom.user_id = current_user.id

    respond_to do |format|
      if @pom.update_attributes(params[:pom])
        format.html { redirect_to(@pom, :notice => 'pom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pom.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @pom = Pom.find(params[:id])
    @pom.destroy

    respond_to do |format|
      format.html { redirect_to(poms_url) }
      format.xml  { head :ok }
    end
  end
end
