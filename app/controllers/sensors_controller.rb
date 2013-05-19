class SensorsController < ApplicationController
  before_filter :authenticate_user!
  # GET /sensors
  # GET /sensors.json
  def index
    @sensors = Sensor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sensors }
    end
  end

  # GET /sensors/1
  # GET /sensors/1.json
  def show
    @sensor = Sensor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sensor }
    end
  end

  # GET /sensors/new
  # GET /sensors/new.json
  def new
    @sensor = Sensor.new
    @project = Project.find(params[:project_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sensor }
    end
  end

  # GET /sensors/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @sensor = @project.sensors.find(params[:id])
  end

  # POST /sensors
  # POST /sensors.json
  def create
    @project = Project.find(params[:sensor][:project_id])
    @sensor =  Sensor.new(params[:sensor])
    @project.sensors << @sensor

    respond_to do |format|
      if @sensor.save
        format.html { redirect_to @project, notice: 'Sensor was successfully created.' }
        format.json { render json: @sensor, status: :created, location: @sensor }
      else
        format.html { render action: "new" }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sensors/1
  # PUT /sensors/1.json
  def update
    @project = Project.find(params[:project_id])
    @sensor = @project.sensors.find(params[:id])

    respond_to do |format|
      if @sensor.update_attributes(params[:sensor])
        format.html { redirect_to @project, notice: 'Sensor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sensors/1
  # DELETE /sensors/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @sensor = @project.sensors.find(params[:id])
    @sensor.delete
    @project.save

    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
    end
  end
end
