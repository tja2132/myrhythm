class CalendarsController < ApplicationController
  before_action :set_day, only: %i[ daily ]

  def weekly
    
  end

  def daily

  end

  private
  def set_day
    @day = params[:day] || "Mon"
  end

end