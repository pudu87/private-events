class EventsController < ApplicationController

  def index
    @events = Event.all
    @upcoming_events = @events.upcoming
    @previous_events = @events.previous
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
    @confirmed_users = User.find_by_sql ["
      SELECT * FROM users
      JOIN attendances 
      ON users.id = attendee_id AND attended_event_id = ?
      WHERE attendances.present
    ", params[:id]]
    @uninvited_users = User.find_by_sql ["
      SELECT * FROM users
      LEFT JOIN attendances 
      ON users.id = attendee_id AND attended_event_id = ?
      WHERE attendances.id IS NULL
      ", params[:id]]
  end

end
