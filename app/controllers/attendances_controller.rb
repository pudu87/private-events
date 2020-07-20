class AttendancesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @user = User.find_by_name(params[:user_name])
    @event.attendances.create(attendee_id: @user.id, present: false)
    redirect_to root_path
  end

  def update
    @attendance = Attendance.find(params[:id])
    user_id = @attendance.attendee_id
    @attendance.present = true
    @attendance.save
    redirect_to user_path(user_id)
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    user_id = @attendance.attendee_id
    @attendance.destroy
    redirect_to user_path(user_id)
  end

end
