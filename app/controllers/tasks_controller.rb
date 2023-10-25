class TasksController < ApplicationController
  before_action :force_index_redirect, only: [:index]

  def show
    id = params[:id] # retrieve movie ID from URI route
    @task = Task.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @tasks = Task.all

    # session['ratings'] = ratings_list
    # session['sort_by'] = @sort_by
  end

  def new
    # default: render 'new' template
  end

  def create
    @task = Task.create!(task_params)
    flash[:notice] = "#{@task.title} was successfully created."
    redirect_to tasks_path
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    @task.update_attributes!(task_params)
    flash[:notice] = "#{@task.title} was successfully updated."
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task '#{@task.title}' deleted."
    redirect_to tasks_path
  end

  private

  def force_index_redirect
    # if !params.key?(:ratings) || !params.key?(:sort_by)
    #   flash.keep
    #   url = movies_path(sort_by: sort_by, ratings: ratings_hash)
    #   redirect_to url
    # end
  end

end
