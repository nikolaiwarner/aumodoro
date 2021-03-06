class ContextsController < ApplicationController
  load_and_authorize_resource
  
  before_filter :set_section
  def set_section
      @section_name = 'contexts'
  end
  
  def index
    @contexts = Context.where(:user_id => current_user.id).order('name ASC').page(params[:page]).per(20)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contexts }
    end
  end

  # GET /contexts/1
  # GET /contexts/1.xml
  def show
    @context = Context.where(:user_id => current_user.id).find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @context }
    end
  end

  # GET /contexts/new
  # GET /contexts/new.xml
  def new
    @context = Context.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @context }
    end
  end

  # GET /contexts/1/edit
  def edit
    @context = Context.find(params[:id])
  end

  
  def create
    @context = Context.new(params[:context])
    @context.user_id = current_user.id

    respond_to do |format|
      if @context.save
        format.html { redirect_to(@context, :notice => 'Context was successfully created.') }
        format.xml  { render :xml => @context, :status => :created, :location => @context }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @context.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contexts/1
  # PUT /contexts/1.xml
  def update
    @context = Context.find(params[:id])
    @context.user_id = current_user.id


    respond_to do |format|
      if @context.update_attributes(params[:context])
        format.html { redirect_to(@context, :notice => 'Context was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @context.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contexts/1
  # DELETE /contexts/1.xml
  def destroy
    @context = Context.find(params[:id])
    @context.destroy

    respond_to do |format|
      format.html { redirect_to(contexts_url) }
      format.xml  { head :ok }
    end
  end
end
