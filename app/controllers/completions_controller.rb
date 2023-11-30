class CompletionsController < ApplicationController
  before_action :set_timeframe, only: %i[ show ]
  before_action :set_completion_grouping, only: %i[ show ]

  def show
    @completions = current_user.completions.all
  end

  private
  def set_timeframe
    @timeframe = params[:timeframe] || 7
  end

  def set_completion_grouping
    @completion_grouping = params[:completion_grouping] || "Day"
  end

  def completion_params
    params.require(:completion).permit(:routine, :user, :completion_grouping, :timeframe, :created, :updated)
  end
end