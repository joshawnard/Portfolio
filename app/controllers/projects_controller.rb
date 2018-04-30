class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @page_title = "Projects | Joshua Ard Portfolio"
  end

  def angular
    @angular_projects = Project.angular
  end

  def new
    @project = Project.new

    3.times do
      @project.technologies.build
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: "Project was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
    end
  end

  private

    def project_params
      params.require(:project).
      permit(
        :title,
        :subtitle,
        :body,
        technologies_attributes: [:name]
      )
    end
end
