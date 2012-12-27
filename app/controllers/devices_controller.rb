class DevicesController < ApplicationController
  # GET /devices
  # GET /devices.json
  def index
    if current_user.has_role? :admin
      @devices = Device.all
    else
      unless current_user.company_id.nil?
        @devices = Device.where("company_id = #{current_user.company_id}")
      else
        @devices = nil
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    @device = Device.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/new
  # GET /devices/new.json
  def new
    @device = Device.new
    puts "Device Session: #{session.inspect}"
    if session[:follow_workflow] == true
      puts "Following Workflow"
    else
      puts "NOT following workflow"
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/1/edit
  def edit
    @device = Device.find(params[:id])
  end

  # POST /devices
  # POST /devices.json
  def create
    if session[:follow_workflow] == true
      # puts "Merging params with session: #{session.inspect}"
      params[:device][:upload_id] = Upload.find(session[:workflow_upload])
      # puts "NEW params: #{params.inspect}"
    # else
      # puts "NOT following workflow in device"
    end
    @device = Device.new(params[:device])
    
    # puts "Device Params: #{params[:device]}"
    if @device.company.nil?
      @device.company = current_user.company unless current_user.has_role? :admin
    end
    # puts "Current_user.company = #{current_user.company_id}"
    respond_to do |format|
      if @device.save
        session[:follow_workflow] = nil
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render json: @device, status: :created, location: @device }
      else
        format.html { render action: "new" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
    # End of workflow
    current_user.follow_workflow(session,false)
  end

  # PUT /devices/1
  # PUT /devices/1.json
  def update
    @device = Device.find(params[:id])

    respond_to do |format|
      if @device.update_attributes(params[:device])
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device = Device.find(params[:id])
    @device.destroy

    respond_to do |format|
      format.html { redirect_to devices_url }
      format.json { head :no_content }
    end
  end
end
