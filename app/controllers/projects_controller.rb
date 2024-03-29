class ProjectsController < ApplicationController
  helper_method :sort_column, :sort_direction

  # Handle errors if no records found
  around_filter :catch_not_found, :only => [:edit, :delete]

  # Devise uses this to control access to only allow signed in users access to see projects
  before_filter :authenticate_user!
  before_filter :owns_project, :only => [:edit, :delete]



  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.search(params[:search], current_user, params[:page]).order(sort_column + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.js
      #format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

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
    @sprints = @project.sprints
    @product_backlogs = @project.product_backlogs
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.user = current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to edit_project_path(@project), notice: 'Project was successfully created.' }
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

  # private methods start here
  private

  def owns_project
    if !user_signed_in? || current_user != Project.find(params[:id]).user
      redirect_to projects_path, error: "You do not have permission to peform that action."
    end
  end

  # catches active record not found errors and redirects to root
  def catch_not_found
    yield

  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def sort_column
    Project.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
