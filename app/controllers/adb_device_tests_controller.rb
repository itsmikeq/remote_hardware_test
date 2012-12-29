class AdbDeviceTestsController < ApplicationController
  # GET /adb_device_tests
  # GET /adb_device_tests.json
  def index
    @adb_device_tests = AdbDeviceTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adb_device_tests }
    end
  end

  # GET /adb_device_tests/1
  # GET /adb_device_tests/1.json
  def show
    @adb_device_test = AdbDeviceTest.find(params[:id])
    # @adb_device_test.script = AdbDeviceTest.highlight(AdbDeviceTest.find(params[:id]).script)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @adb_device_test }
    end
  end

  # GET /adb_device_tests/new
  # GET /adb_device_tests/new.json
  def new
    @adb_device_test = AdbDeviceTest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @adb_device_test }
    end
  end

  # GET /adb_device_tests/1/edit
  def edit
    @adb_device_test = AdbDeviceTest.find(params[:id])
  end

  # POST /adb_device_tests
  # POST /adb_device_tests.json
  def create
    @adb_device_test = AdbDeviceTest.new(params[:adb_device_test])

    respond_to do |format|
      if @adb_device_test.save
        format.html { redirect_to @adb_device_test, notice: 'Adb device test was successfully created.' }
        format.json { render json: @adb_device_test, status: :created, location: @adb_device_test }
      else
        format.html { render action: "new" }
        format.json { render json: @adb_device_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /adb_device_tests/1
  # PUT /adb_device_tests/1.json
  def update
    @adb_device_test = AdbDeviceTest.find(params[:id])

    respond_to do |format|
      if @adb_device_test.update_attributes(params[:adb_device_test])
        format.html { redirect_to @adb_device_test, notice: 'Adb device test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @adb_device_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adb_device_tests/1
  # DELETE /adb_device_tests/1.json
  def destroy
    @adb_device_test = AdbDeviceTest.find(params[:id])
    @adb_device_test.destroy

    respond_to do |format|
      format.html { redirect_to adb_device_tests_url }
      format.json { head :no_content }
    end
  end

  def start
    puts "#{params.inspect}"
    # TODO: Check if user has permission
    @adb_device_test = AdbDeviceTest.find(params[:id])
    if (!(current_user.has_role?(:device_admin)||current_user.has_role?(:admin)))
      render 401
    end
    flash[:notice] = "Started.  Available Devices: #{@adb_device_test.devices}"
    # @output = `adb shell #{@adb_device_test.script}`
    @adb_device_test.shell(@adb_device_test.script)
    redirect_to 'command_output' && return
    respond_to do |format|
      format.html { redirect_to adb_device_tests_url }
      format.json { head :no_content }
    end
  end
end
