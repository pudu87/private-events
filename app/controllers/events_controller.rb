class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
  end

  def create
    if current_user
      @event = current_user.events.build(event_params)
      if @event.save
        flash[:success] = "Event successfully created!"
        redirect_to root_path
      else
        render :new
      end
    else
      flash.now[:alert] = "Please log in first to create an event."
      render root_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

end
