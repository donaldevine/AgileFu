class ProductBacklogsController < ApplicationController
  # GET /product_backlogs
  # GET /product_backlogs.json
  def index
    @product_backlogs = ProductBacklog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_backlogs }
    end
  end

  # GET /product_backlogs/1
  # GET /product_backlogs/1.json
  def show
  	@project = Project.find(params[:project_id])
    @product_backlog = ProductBacklog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_backlog }
    end
  end

  # GET /product_backlogs/new
  # GET /product_backlogs/new.json
  def new
  	@project = Project.find(params[:project_id])
    @product_backlog = ProductBacklog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_backlog }
    end
  end

  # GET /product_backlogs/1/edit
  def edit
  	# Retrieve project 
  	@project = Project.find(params[:project_id])
    	@product_backlog = ProductBacklog.find(params[:id])
  end

  # POST /product_backlogs
  # POST /product_backlogs.json
  def create
  	# Retrieve project 
  	@project = Project.find(params[:project_id])
    	@product_backlog = @project.product_backlogs.new(params[:product_backlog])

    respond_to do |format|
      if @product_backlog.save
        format.html { redirect_to project_product_backlog_path(@project, @product_backlog), notice: 'Product backlog was successfully created.' }
        format.json { render json: @product_backlog, status: :created, location: @product_backlog }
      else
        format.html { render action: "new" }
        format.json { render json: @product_backlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_backlogs/1
  # PUT /product_backlogs/1.json
  def update
    @product_backlog = ProductBacklog.find(params[:id])

    respond_to do |format|
      if @product_backlog.update_attributes(params[:product_backlog])
        format.html { redirect_to project_product_backlog_path(@product_backlog.project, @product_backlog), notice: 'Product backlog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_backlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_backlogs/1
  # DELETE /product_backlogs/1.json
  def destroy
    @product_backlog = ProductBacklog.find(params[:id])
    @product_backlog.destroy

    respond_to do |format|
      format.html { redirect_to product_backlogs_url }
      format.json { head :no_content }
    end
  end
end
