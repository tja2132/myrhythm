class RoutinesController < ApplicationController
  before_action :force_index_redirect, only: [:index]

  def show
    id = params[:id] # retrieve movie ID from URI route
    @routine = Routine.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @routines = Routine.all

    # session['ratings'] = ratings_list
    # session['sort_by'] = @sort_by
  end

  def new
    # default: render 'new' template
  end

  def create
    @routine = Routine.create!(routine_params)
    flash[:notice] = "#{@routine.title} was successfully created."
    redirect_to routines_path
  end

  def edit
    @routine = Routine.find params[:id]
  end

  def update
    @routine = Routine.find params[:id]
    @routine.update_attributes!(routine_params)
    flash[:notice] = "#{@routine.title} was successfully updated."
    redirect_to routine_path(@routine)
  end

  def destroy
    @routine = Routine.find(params[:id])
    @routine.destroy
    flash[:notice] = "Routine '#{@routine.title}' deleted."
    redirect_to routines_path
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
