class CompletionsController < ApplicationController
  before_action :set_timeframe, only: %i[ show ]
  before_action :set_completions, only: %i[ show ]

  def show

    @most_comp_title = get_most_completed_routine[0]
    @most_comp_count = get_most_completed_routine[1]
    @most_prod_day = get_most_productive_day[0]
    @most_prod_count = get_most_productive_day[1]

  end

  private

  def set_timeframe
     @timeframe = params[:timeframe].to_i || 7
  end

  def set_completions
      # @completions = current_user.routines.all.flat_map(&:completions)
      @completions = Completion.joins(:routine).where(routines: { user_id: current_user.id })

      if @timeframe > 0
        @completions = @completions.where('completions.created_at >= ?', @timeframe.day.ago)
      end
  end

  def get_most_completed_routine
    max = 0
    title = ""

    comp_counts = @completions.group(:title).references(:completion).count

    comp_counts.keys.each do |k|
      if comp_counts[k] > max
        max = comp_counts[k]
        title = k
      end
    end
    [title, max]
  end

  def get_most_productive_day
    max = 0
    day = ""
    day_counts = @completions.group_by_day_of_week(:created_at, format: "%a").references(:completion).count

    day_counts.keys.each do |k|
      if day_counts[k] > max
        max = day_counts[k]
        day = k
      end
    end

    [day, max]
  end

  def completion_params
    params.require(:completion).permit(:routine, :user, :completion_grouping, :created, :updated)
  end
end