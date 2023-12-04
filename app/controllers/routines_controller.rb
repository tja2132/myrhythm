class RoutinesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ discover discover_show]
  before_action :set_routine, only: %i[ show edit complete update destroy edit_routine_copy]
  # Time.zone = 'EST'


  # GET /routines/discover
  def discover
    @all_tags = Routine.get_tags
    if params[:tags].nil?
      @tags_to_show = []
    else
      tagHash = params[:tags]
      @tags_to_show = tagHash.keys
    end
    @routines = Routine.with_tags(@tags_to_show)
  end

  def edit_routine_copy
    flash[:routine_id] = params[:id]
  end

  def copy_routine
    @routine_params = params[:routine]
    @quick_add = false

    if params[:quick_add].nil?
      @source_routine_id = flash[:routine_id]
      @source_routine = Routine.find(@source_routine_id)
    else
      @quick_add = true
      @routine_params[:is_public] = false
      @source_routine_id = params[:id]
      @source_routine = Routine.find(@source_routine_id)
    end


    #@routine_params[:user_id] = @user.id
    #@source = @routine.dup.tap { |copied_routine| copied_routine.user_id = @user}
    tasks = @source_routine.tasks

    @copied_routine = current_user.routines.create!(
      :title => @routine_params[:title],
      :description => @routine_params[:description],
      :start_time => @routine_params[:start_time],
      :mon => @routine_params[:mon],
      :tue => @routine_params[:tue],
      :wed => @routine_params[:wed],
      :thu => @routine_params[:thu],
      :fri => @routine_params[:fri],
      :sat => @routine_params[:sat],
      :sun => @routine_params[:sun],
      :home => @routine_params[:home],
      :work => @routine_params[:work],
      :school => @routine_params[:school],
      :is_public => @routine_params[:is_public]
    )

    tasks.each do |task|
      @task_attributes = task.attributes
      @task_attributes.delete("id")
      @copied_routine.tasks.create!(@task_attributes)
    end

    flash[:notice] = "#{routine_params[:title]} Routine Copied to My Routines"
    redirect_to discover_path
  end

  def quick_add

  end

  def discover_show
    @routine = Routine.find(params[:id])
  end
  
  # GET /routines or /routines.json
  def index
    if params[:recurrence].nil?
      @recurrence_to_show = []
    else
      recurrenceHash = params[:recurrence]
      @recurrence_to_show = recurrenceHash.keys
    end
    @sortBy = params[:sortBy]
    @all_recurrence = Routine.all_recurrence
    @routines = Routine.with_recurrence(current_user.routines.all, @recurrence_to_show)

    if @sortBy == "title"
      @routines = @routines.sort_by { |routine | routine.title }
    elsif @sortBy == "start_time"
      @routines = @routines.sort_by { |routine | routine.start_time }
    elsif @sortBy == "recurrence"
      @routines = @routines.sort_by { |routine | Routine.get_routine_recurrence(routine) }
    elsif @sortBy == "end_time"
      @routines = @routines.sort_by { |routine | routine.start_time.nil? ? Time.zone.parse('1970-01-01 0:0:0') : routine.start_time + Routine.total_duration(routine).minutes}
    elsif @sortBy == "total_duration"
      @routines = @routines.sort_by { |routine | Routine.total_duration(routine) }
    end
  end

  # GET /routines/new
  def new
    @routine = current_user.routines.new
    @routine.created_at = Time.current
  end

  # GET /routines/1 or /routines/1.json
  def show
  end

  # GET /routines/1/edit
  def edit
  end

  # POST /routines or /routines.json
  def create
    @routine = current_user.routines.create!(routine_params)

    respond_to do |format|
      if @routine.save
        format.html { redirect_to routine_url(@routine), notice: "Routine was successfully created." }
        format.json { render :show, status: :created, location: @routine }
      end
    end
  end

  # PATCH/PUT /routines/1 or /routines/1.json
  def update
    respond_to do |format|
      if @routine.update(routine_params)
        format.html { redirect_to routine_url(@routine), notice: "Routine was successfully updated." }
        format.json { render :show, status: :ok, location: @routine }
        @routine.updated_at = Time.current
      end
    end
  end

  # DELETE /routines/1 or /routines/1.json
  def destroy
    @routine.destroy!

    respond_to do |format|
      format.html { redirect_to routines_url, notice: "Routine was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def complete
    @routine.completions.create

    respond_to do |format|
      format.html { redirect_to routines_url, notice: @routine.title + " was successfully completed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routine
      @routine = current_user.routines.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def routine_params
      params.require(:routine).permit(:title, :description, :daysofweek, :recurrence, :start_time, :created, :updated, :mon, :tue, :wed, :thu, :fri, :sat, :sun, :is_public, :home, :work, :school, :quick_add)
    end

end
