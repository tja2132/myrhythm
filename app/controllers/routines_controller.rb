class RoutinesController < ApplicationController
  before_action :set_routine, only: %i[ show edit update destroy ]

  # GET /routines or /routines.json
  def index
    @routines = Routine.all
  end

  # GET /routines/1 or /routines/1.json
  def show
    puts "showing"
    puts @routine.daysofweek
  end

  # GET /routines/new
  def new
    @routine = Routine.new
  end

  # GET /routines/1/edit
  def edit
    puts @routine.daysofweek
  end

  # POST /routines or /routines.json
  def create
    @routine = Routine.create!(routine_params)
    respond_to do |format|
      daysofweek_str = ""
      if @routine.mon
        daysofweek_str = daysofweek_str + "M"
      end
      if @routine.tue
        daysofweek_str = daysofweek_str + "T"
      end
      if @routine.wed
        daysofweek_str = daysofweek_str + "W"
      end
      if @routine.thu
        daysofweek_str = daysofweek_str + "Th"
      end
      if @routine.fri
        daysofweek_str = daysofweek_str + "F"
      end
      if @routine.sat
        daysofweek_str = daysofweek_str + "Sa"
      end
      if @routine.sun
        daysofweek_str = daysofweek_str + "Su"
      end

      @routine.daysofweek = daysofweek_str

      if @routine.mon and @routine.tue and @routine.wed and @routine.thu and @routine.fri and @routine.sat and @routine.sun
        @routine.recurrence = "Daily"
      else
        @routine.recurrence = "Weekly"
      end

      if @routine.save
        format.html { redirect_to routine_url(@routine), notice: "Routine was successfully created." }
        format.json { render :show, status: :created, location: @routine }
      end
    end
  end

  # PATCH/PUT /routines/1 or /routines/1.json
  def update
    respond_to do |format|
      daysofweek_str = ""
      if @routine.mon
        daysofweek_str = daysofweek_str + "M"
      end
      if @routine.tue
        daysofweek_str = daysofweek_str + "T"
      end
      if @routine.wed
        daysofweek_str = daysofweek_str + "W"
      end
      if @routine.thu
        daysofweek_str = daysofweek_str + "Th"
      end
      if @routine.fri
        daysofweek_str = daysofweek_str + "F"
      end
      if @routine.sat
        daysofweek_str = daysofweek_str + "Sa"
      end
      if @routine.sun
        daysofweek_str = daysofweek_str + "Su"
      end

      @routine.daysofweek = daysofweek_str

      if @routine.mon and @routine.tue and @routine.wed and @routine.thu and @routine.fri and @routine.sat and @routine.sun
        @routine.recurrence = "Daily"
      else
        @routine.recurrence = "Weekly"
      end
      if @routine.update(routine_params)
        format.html { redirect_to routine_url(@routine), notice: "Routine was successfully updated." }
        format.json { render :show, status: :ok, location: @routine }
      end
      puts "updating"
      puts @routine.daysofweek
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routine
      @routine = Routine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def routine_params
      params.require(:routine).permit(:title, :description, :daysofweek, :recurrence, :start_date, :start_time, :end_date, :end_time, :created, :updated, :mon, :tue, :wed, :thu, :fri, :sat, :sun)
    end
end
