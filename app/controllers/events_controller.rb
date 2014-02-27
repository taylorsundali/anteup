class EventsController < ApplicationController
  
  layout "admin"
  def index
    @event = Event.order("event_date ASC")
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new({:price_per_person => 5, :event_status => "New"})
    #http://guides.rubyonrails.org/action_controller_overview.html#filters
    #######################
    # I'm fairly certain I need to have a filter (see link above) to require a login
    # in order to create an event. 
    
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
  # Find an existing object using form parameters
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
  # update the object
  # If the update succeeds, redirect to the index action
      flash[:notice] = "Event Updated Successfully!"
      redirect_to(:action => 'show', :id => @event.id)
    else
      render('edit')
  # If the update fails, reload the form so the user can fix the problems
    end
  end

  def create
  # Instantiate a new object using form parameters
    @event = Event.new(event_params)
  # Save the object
    if @event.save
  # If the save succeeds, redirect to the index ApplicationController
      flash[:notice] = "Event Created Successfully! To view your event, please register or login."
      redirect_to(:controller => :users, :action => :new)
    else
      render('new')
  # If the save fails, reload the form so the user can fix the problems
    end
  end

  def delete
    @event = Event.find(params[:id])
  end

  def destroy 
    event = Event.find(params[:id]).destroy
    flash[:notice] = "Event '#{event.event_name}' Deleted Successfully!"
    redirect_to(:action => 'index')
  end

  private 
    def event_params
      #same as using "params[:event]", except it:
      # - raises an error if :event is not present
      # - allowes listed attributes to be mass assigned
      params.require(:event).permit(:event_name, :event_location, :event_attendees, :attendee_floor, :attendee_ceiling, :price_per_person, :ante_date, :ante_time, :event_date, :event_time, :event_status)
    end

end
