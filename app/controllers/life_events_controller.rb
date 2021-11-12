class LifeEventsController < ApplicationController

  before_action :set_life_event, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create]

  # GET /users/1/life_events
  def index
    @life_events = LifeEvent.all_for_user(@user)

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /life_events/1
  def show
  end

  # GET /users/1/life_events/new
  # Create a new life event for this user
  def new
    @life_event = LifeEvent.new( user: @user)
#    @life_event.user = @user
  end

  # GET /life_events/1/edit
  def edit
    @life_event.happened_at = Time.zone.yesterday if @life_event.happened_at.nil?
  end

  # POST /users/1/life_events
  def create
    @life_event = LifeEvent.new(life_event_params)
    @life_event.user = @user

    respond_to do |format|
      if @life_event.save
        format.html { redirect_to user_life_events_path(@user),
                                  notice: 'Life event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /life_events/1
  def update
    update_flag = @life_event.update(life_event_params)
    respond_to do |format|
      if update_flag
        format.html { redirect_to @life_event, notice: 'Life event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /life_events/1
  def destroy
    @life_event.destroy
    redirect_to life_events_url, notice: 'Life event was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_life_event
    @life_event = LifeEvent.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def life_event_params
    params.require(:life_event).permit(:description, :happened_at, :user_id)
  end

end
