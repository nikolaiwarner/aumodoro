class TasksController < ApplicationController
  load_and_authorize_resource


  def index
    @tasks = Task.where(:user_id => current_user.id).order('name ASC').page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end


  def show
    @task = Task.where(:user_id => current_user.id).find(params[:id])
    @groups = current_user.groups


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end


  def new
    @task = Task.new
    @groups = current_user.groups


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end


  def edit
    @task = Task.where(:user_id => current_user.id).find(params[:id])
    @groups = current_user.groups

  end


  def create
    @task = Task.new(params[:task])
    @task.user = current_user

    respond_to do |format|
      if @task.save
        format.html { redirect_to(@task, :notice => 'Task was successfully created.') }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @task = Task.where(:user_id => current_user.id).find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @task = Task.where(:user_id => current_user.id).find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end
end
