class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
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

  private

    def project_params
      params.require(:project).permit(:title, :subtitle, :body)
    end
end
