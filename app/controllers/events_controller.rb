class EventsController < ApplicationController
  before_action do
    @company = Company.find(params[:company_id])
  end

  def index
    @events = @company.events
  end

  def new
    @event = @company.events.new
  end

  def create
    @event = @company.events.new(event_params)

    if @event.save
      redirect_to company_path(params[:company_id])
    else
      render :new
    end
  end

  def show
    @event = @company.events.find(params[:id])
  end

  def edit
    @event = @company.events.find(params[:id])
  end

  def update
    @event = @company.events.find(params[:id])

    if @event.update(event_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @event = @company.events.find(params[:id])

    @event.destroy
      redirect_to company_path(@company)
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :company_id)
  end

end
