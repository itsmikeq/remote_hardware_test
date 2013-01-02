class UploadsController < ApplicationController
  # GET /uploads
  # GET /uploads.json
  def index
    if current_user.has_role? :admin
      @uploads = Upload.all
    else
      @uploads = Upload.where("company_id = #{current_user.company_id}")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @upload = Upload.new
    if params[:follow_workflow] == "true"
      current_user.follow_workflow(session,true)
    end
    if Rails.env == "development"
      puts "Params: #{params}"
      puts "Session: #{session.inspect}"
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  def create
    puts "Uploads Create Params: #{params.inspect}" if Rails.env == "development"
    @upload = Upload.new(params[:upload])
    unless current_user.has_role? :admin
      @upload.company_id = current_user.company
    end
    if params[:company_id].nil?
      params[:company_id] = current_user.company_id
    end
    params[:user_id] = current_user.id
    respond_to do |format|
      if @upload.save
        # puts "Session: #{session.inspect}"
        if session[:follow_workflow] == true
          current_user.add_workflow_upload(session,@upload.id)
          # puts "Upload session: #{session.inspect}"
          redirect_to("/devices/new") and return
        end

        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render json: @upload, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
        current_user.follow_workflow(session,false)
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
end
