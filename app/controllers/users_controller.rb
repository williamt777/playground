class UsersController < ApplicationController
  require "csv"
  include UsersHelper

  before_action :set_user, only: [:show, :edit, :update, :destroy,
                                  :increment, :clear, :new_life_event]

  # GET /
  def root
  end

  # GET /users
  def index
    # default is sort by name, ascending
    @sort_by = "nA"
    @sort_by = params["sort_by"] if params["sort_by"].present?

    # set sorts for next call
    @name_sort = "nA"
    @email_sort = "eA"
    @stars_sort = "sA"

    case @sort_by
    when "nA"
      @users = User.order("name ASC")
      @name_sort = "nD"
    when "nD"
      @users = User.order("name DESC")
    when "eA"
      @users = User.order("email ASC")
      @email_sort = "eD"
    when "eD"
      @users = User.order("email DESC")
    when "sA"
      @users = User.order("stars DESC")
      @stars_sort = "sD"
    when "sD"
      @users = User.order("stars ASC")
    else
      @users = User.order("name ASC")
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @schools = School.all_schools
  end

  # GET /users/1/edit
  def edit
    @user.party_started_at = Time.zone.now if @user.party_started_at.nil?
    @schools = School.all_schools
  end

  # POST /users
  def create
    debugger
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    # update party start and end times
    dt_hash = ux_calc_party_times(params[:user][:party_started_at],
                                  params[:user][:party_start_time],
                                  params[:user][:party_duration])
    @user.party_started_at = dt_hash[:start]
    @user.party_ended_at = dt_hash[:end]
    @user.save

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH /users/1/increment
  def increment
    @user.increment!( :stars)
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Increment ok'}
      format.js
    end
  end

  # PATCH /users/1/clear
  def clear
    @user.stars = 0
    @user.save
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Stars are now zero'}
      format.js
    end
  end

  # GET /users/1/import_csv
  def import_csv
  end

  # GET /users/1/import_csv
  def update_csv
    @user_csv_guy = UserCsvGuy.new(params[:csv_data])
    respond_to do |format|
      format.js
    end
  end

  # GET /users/1/import_csv2
  def import_csv2
  end

  # GET /users/1/update_csv2
  def update_csv2
    # really add the CSV data to the session here
    @user_csv_guy = UserCsvGuy.new(params[:import_str])
    @user_csv_guy.accept_rows

    redirect_to import_csv_path, notice: 'CSV data accepted'
  end

  # GET /users/1/chart_fun
  def chart_fun
  end

  # GET /users/1/my_calendar_test
  def my_calendar_test
    @my_calendar = MySimpleCalendar.new(params)
    d1 = Date.current - 1.day
    d2 = Date.current - 1.week
    d3 = Date.current + 1.month
    list1 = [d1, d2, d3]
    @my_calendar.add_item_dates(list1)
    update_blather(@my_calendar.selected_date)
  end

  # GET /users/1/calendar_test
  def calendar_test
    @blather = if params["the_date"]
                 "Date selected is " + params["the_date"]
               else
                 "Nothing to say, Bill"
               end

    item1 = CalendarItem.new( Date.new(2021, 10, 15).to_datetime, "TY due!")
    item2 = CalendarItem.new( Date.new(2021, 10, 22), "Trip to Portland, ME")
    @events = []
    @events << item1 << item2
    d1 = params["start_date"].to_date if params["start_date"]
    d1 ||= Date.today
    test = Util.month_name(d1)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user)
            .permit(:name, :email, :school_id, :stars, :comment,
                    :party_started_at, :party_start_time, :party_duration)
    end

    def update_blather(the_date)
      if the_date
        @blather = "Selected date is " + the_date.strftime("%b %-d, %Y")
      else
        @blather = "No date selected yet"
      end
    end
end
