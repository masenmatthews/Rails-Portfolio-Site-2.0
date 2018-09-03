class ProjectsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :destroy, :update]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @user = User.find(session[:user_id])
    @project = @user.projects.new(project_params)
    if @project.save
      flash[:notice] = "Thanks, your project has been added to the list!"
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def update
    @project = Project.find(params[:id])
    if @project.update!(project_params)
      flash[:notice] = "Good job! Your project was updated!"
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  private
  def project_params
    params.require(:project).permit(:image, :project_title, :project_body)
  end
end
