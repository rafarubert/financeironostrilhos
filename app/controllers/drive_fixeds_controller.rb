class DriveFixedsController < ApplicationController
  # GET /drive_fixeds
  # GET /drive_fixeds.xml
  def index
    @drive_fixeds = DriveFixed.find(:all)
    @contas = Account.find(:all, :conditions=>["user_id = ?", self.current_user.id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @drive_fixeds }
    end
  end

  # GET /drive_fixeds/1
  # GET /drive_fixeds/1.xml
  def show
    @drive_fixed = DriveFixed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @drive_fixed }
    end
  end

  # GET /drive_fixeds/new
  # GET /drive_fixeds/new.xml
  def new
    @drive_fixed = DriveFixed.new
    @categories = Category.find(:all, :conditions=>["user_id = ?", self.current_user.id]).collect{|c| [c.title, c.id]}
    @accounts = Account.find(:all, :conditions=>["user_id = ?", self.current_user.id]).collect{|c| [c.title, c.id]}
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @drive_fixed }
    end
  end

  # GET /drive_fixeds/1/edit
  def edit
    @drive_fixed = DriveFixed.find(params[:id])
  end

  # POST /drive_fixeds
  # POST /drive_fixeds.xml
  def create
    @drive_fixed = DriveFixed.new(params[:drive_fixed])
    if params[:sem_data_final]
      @drive_fixed.date_limit = nil
    end
    respond_to do |format|
      if @drive_fixed.save
        flash[:notice] = 'DriveFixed was successfully created.'
        format.html { redirect_to(@drive_fixed) }
        format.xml  { render :xml => @drive_fixed, :status => :created, :location => @drive_fixed }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @drive_fixed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /drive_fixeds/1
  # PUT /drive_fixeds/1.xml
  def update
    @drive_fixed = DriveFixed.find(params[:id])
    if params[:sem_data_final]
      @drive_fixed.date_limit = nil
    end
    respond_to do |format|
      if @drive_fixed.update_attributes(params[:drive_fixed])
        flash[:notice] = 'DriveFixed was successfully updated.'
        format.html { redirect_to(@drive_fixed) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @drive_fixed.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /drive_fixeds/1
  # DELETE /drive_fixeds/1.xml
  def destroy
    @drive_fixed = DriveFixed.find(params[:id])
    @drive_fixed.destroy

    respond_to do |format|
      format.html { redirect_to(drive_fixeds_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def filter_account
   @driver_fixeds = DriveFixed.find(:all, :conditions=>[" account_id = ?", params[:contas]])
   render :partial=>"lista_gastos", :locals=>{:drive_fixeds=>@driver_fixeds} 
  end
end
