class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @sensors = @project.sensors

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  # returns the result of a query
  # sensors: if null returns data for all sensors in the project
  # start_time: if null returns data starting at the first result
  # end_time: if null returns data until the current time
  # result_limit: the max total number of results required, if null returns them all
  # result_type: 'json' for now, maybe 'zip' or something later
  def data
    @project = Project.find params[:project_id]
    sensors = params['sensors']
    start_time = params['start_time']
    end_time = params['end_time']
    result_limit = params['limit']
    result_type = params['result_type']

    query = SensorReadingQuery.new @project, sensor_indices: sensors, start_time: start_time, end_time: end_time, result_limit: result_limit, result_type: result_type
    render json: query.result

  end
end
