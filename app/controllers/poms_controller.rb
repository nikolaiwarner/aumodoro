class PomsController < ApplicationController
  load_and_authorize_resource


  def index
    @poms = Pom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @poms }
    end
  end

  # GET /poms/1
  # GET /poms/1.xml
  def show
    @pom = Pom.find(params[:id])
    @groups = current_user.groups

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pom }
    end
  end

  # GET /poms/new
  # GET /poms/new.xml
  def new
    @pom = Pom.new
    
    @groups = current_user.groups


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pom }
    end
  end

  # GET /poms/1/edit
  def edit
    @pom = Pom.find(params[:id])
    @groups = current_user.groups
  end

  # POST /poms
  # POST /poms.xml
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

  # PUT /poms/1
  # PUT /poms/1.xml
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

  # DELETE /poms/1
  # DELETE /poms/1.xml
  def destroy
    @pom = Pom.find(params[:id])
    @pom.destroy

    respond_to do |format|
      format.html { redirect_to(poms_url) }
      format.xml  { head :ok }
    end
  end
end
