class TasksController < ApplicationController

  # Handle errors if no records found
  around_filter :catch_not_found, :only => [:edit, :delete]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @sprint = Sprint.find(params[:sprint_id])
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @project = Project.find(params[:project_id])
    @sprint = Sprint.find(params[:sprint_id])
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @sprint = Sprint.find(params[:sprint_id])
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @project = Project.find(params[:project_id])
    @sprint = Sprint.find(params[:sprint_id])
    @task = @sprint.tasks.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to edit_project_sprint_path(@project, @sprint), notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @project = Project.find(params[:project_id])
    @sprint = Sprint.find(params[:sprint_id])
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to edit_project_sprint_path(@project, @sprint), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  # private methods start here
  private

  # catches active record not found errors and redirects to root
  def catch_not_found
    yield

    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end
end
