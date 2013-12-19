class SprintsController < ApplicationController

  # Handle errors if no records found
  around_filter :catch_not_found, :only => [:edit, :delete]


  # GET /sprints
  # GET /sprints.json
  def index
    @sprints = Sprint.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sprints }
    end
  end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
    @project = Project.find(params[:project_id])
    @sprint = Sprint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sprint }
    end
  end

  # GET /sprints/new
  # GET /sprints/new.json
  def new
    @project = Project.find(params[:project_id])
    @sprint = Sprint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sprint }
    end
  end

  # GET /sprints/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @sprint = Sprint.find(params[:id])
  end

  # POST /sprints
  # POST /sprints.json
  def create
    @project = Project.find(params[:project_id])
    @sprint = @project.sprints.new(params[:product_backlog])

    respond_to do |format|
      if @sprint.save
        format.html { redirect_to edit_project_path(@project) , notice: 'Sprint was successfully created.' }
        format.json { render json: @sprint, status: :created, location: @sprint }
      else
        format.html { render action: "new" }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sprints/1
  # PUT /sprints/1.json
  def update
    @sprint = Sprint.find(params[:id])
    @project = Project.find (@sprint.project_id)

    respond_to do |format|
      if @sprint.update_attributes(params[:sprint])
        format.html { redirect_to project_sprint_path(@project, @sprint), notice: 'Sprint was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    @sprint = Sprint.find(params[:id])
    @sprint.destroy

    respond_to do |format|
      format.html { redirect_to sprints_url }
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
