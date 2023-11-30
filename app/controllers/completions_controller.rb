class CompletionsController < ApplicationController
  before_action :set_completion_grouping, only: %i[ show ]

  def show
    @completions = current_user.completions.all
  end

  private

  def set_completion_grouping
    @completion_grouping = params[:completion_grouping] || "Week"
  end

  def completion_params
    params.require(:completion).permit(:routine, :user, :completion_grouping, :created, :updated)
  end
end