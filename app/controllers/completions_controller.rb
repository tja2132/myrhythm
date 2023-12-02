class CompletionsController < ApplicationController
  before_action :set_completions, only: %i[ show ]

  def show
  end

  private

  def set_completions
      # @completions = current_user.routines.all.flat_map(&:completions)
      @completions = Completion.joins(:routine).where(routines: { user_id: current_user.id })
      puts @completions.inspect

  end

  def completion_params
    params.require(:completion).permit(:routine, :user, :completion_grouping, :created, :updated)
  end
end