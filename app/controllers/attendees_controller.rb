class AttendeesController < ApplicationController
  def create
    attend = Attendee.create(user: current_user, event: Event.find(params[:event_id]))
    redirect_to "/events"
  end
  def destroy
    Attendee.destroy(params[:id])
    redirect_to "/events"
  end
end
