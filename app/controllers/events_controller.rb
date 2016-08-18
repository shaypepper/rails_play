class EventsController < ApplicationController
  def index
    @events = {
      :local => Event.where(:state => current_user.state),
      :other => Event.where.not(:state => current_user.state)
    }
  end

  def create
    event = Event.new(event_params)
    event.user = current_user
    if event.save
      redirect_to :back
    else
      flash_errors event
      redirect_to :back
    end
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    if event.invalid?
      flash_errors event
      redirect_to "/events/#{params[:id]}/edit"
    else
      redirect_to "/events"
    end
  end

  def destroy
    Event.destroy(params[:id])
    redirect_to "/events"

  end

  private
    def event_params
      params.require(:event).permit(:name, :date, :city, :state)
    end
end
