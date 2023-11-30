class RoutinesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ discover ]
  before_action :set_routine, only: %i[ show edit update destroy ]

  # GET /routines/discover
  def discover
    @routines = Routine.all
  end
  
  # GET /routines or /routines.json
  def index
    @routines = current_user.routines.all
    @sortBy = params[:sortBy]
    if @sortBy == "title" or @sortBy == "start_time"
      @routines = @routines.order(@sortBy)
    elsif @sortBy == "recurrence"
      @routines = @routines.sort_by { |routine | Routine.get_routine_recurrence(routine) }
    elsif @sortBy == "end_time"
      @routines = @routines.sort_by { |routine | routine.start_time.nil? ? Time.zone.parse('1970-01-01 0:0:0') : routine.start_time + Routine.total_duration(routine).minutes}
    end
  end

  # GET /routines/new
  def new
    @routine = current_user.routines.new
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
    current_user.completions.create!(user: current_user, routine: @routine)

    respond_to do |format|
      format.html { redirect_to routines_url, notice: "Routine was successfully completed." }
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
      params.require(:routine).permit(:title, :description, :daysofweek, :recurrence, :start_time, :created, :updated, :mon, :tue, :wed, :thu, :fri, :sat, :sun)
    end
end
