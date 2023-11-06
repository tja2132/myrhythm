class TasksController < ApplicationController
  before_action :get_routine
  before_action :set_task, only: %i[ show edit update destroy ]
  after_action :enforce_unique_sequence

  # GET /tasks or /tasks.json
  def index
    @tasks = @routine.tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = @routine.tasks.build
  end

  # GET /tasks/1/edit
  def edit

  end

  # POST /tasks or /tasks.json
  def create
    @task = @routine.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to routine_tasks_path(@routine), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to routine_task_path(@routine), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to routine_tasks_path(@routine), notice: "Task was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def up
    @routine = Routine.find(params[:routine_id])
    @task = Task.find(params[:task_id])

    if @task.sequence > 1
      tasks = Task.with_same_routine(@routine)
      tasks.each do |t|
        if t.sequence == @task.sequence - 1
          t.sequence += 1
          t.save
        end
      end

      @task.sequence -= 1
      @task.save
    end

    redirect_to routine_path(@routine)
  end

  def down

    @routine = Routine.find(params[:routine_id])
    @task = Task.find(params[:task_id])

    if @task.sequence <= @routine.tasks.size
      tasks = Task.with_same_routine(@routine)
      tasks.each do |t|
        if t.sequence == @task.sequence + 1
          t.sequence -= 1
          t.save
        end
      end
      @task.sequence += 1
      @task.save
    end

    redirect_to routine_path(@routine)
  end

  private
  # Get parent routine
    def get_routine
      @routine = Routine.find(params[:routine_id])
    end

  # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @routine.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :duration, :sequence)
    end

    def enforce_unique_sequence

      if @routine.tasks.size > 1
        tasks = Task.where(routine: @routine.id).order(:sequence)
        seq = 1
        tasks.each do |t|
          t.sequence = seq
          t.save
          seq += 1
        end
      end
    end
end
