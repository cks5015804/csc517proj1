class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  include SessionsHelper

  # GET /projects
  # GET /projects.json
  def index
    if logged_in? and admin?
      @projects = Project.all
    elsif logged_in?
      @user = current_user
      if @user.project_id
        @projects = Project.find([@user.project_id, @user.project_id])
      end
    else
      @projects = []
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @stories = Story.where("project_id = '#{@project.id}'")
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_sign
    @user = User.find(params[:id])

    respond_to do |format|
      format.html { render :sign }
      format.json { head :no_content }
    end
  end

  def sign
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])

    # remove from stories in a different project
    if @user.project_id != @project.id
      @user.update_attributes!(:story_id => nil)
    end

    # change project of user
    @user.update_attributes!(:project_id => @project.id)


    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Project was successfully signed for user.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title,:description)
    end
end
