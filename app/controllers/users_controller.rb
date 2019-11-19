class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :increment, :clear]

  # GET /users
  # GET /users.json
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
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
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
  # PATCH/PUT /users/1.json
  def update
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
  # DELETE /users/1.json
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :stars, :comment)
    end
end
