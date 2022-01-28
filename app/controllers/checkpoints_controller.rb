class CheckpointsController < ApplicationController
  before_action :set_checkpoint, only: %i[ show edit update destroy ]

  # GET /checkpoints or /checkpoints.json
  def index
    @checkpoints = Checkpoint.all
  end

  # GET /checkpoints/1 or /checkpoints/1.json
  def show
  end

  # GET /checkpoints/new
  def new
    @checkpoint = Checkpoint.new
  end

  # GET /checkpoints/1/edit
  def edit
  end

  # POST /checkpoints or /checkpoints.json
  def create
    @checkpoint = Checkpoint.new(checkpoint_params)
    @checkpoint.school = School.first

    respond_to do |format|
      if @checkpoint.save
        format.html { redirect_to @checkpoint, notice: "Checkpoint was successfully created." }
        format.json { render :show, status: :created, location: @checkpoint }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checkpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkpoints/1 or /checkpoints/1.json
  def update
    respond_to do |format|
      if @checkpoint.update(checkpoint_params)
        format.html { redirect_to @checkpoint, notice: "Checkpoint was successfully updated." }
        format.json { render :show, status: :ok, location: @checkpoint }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @checkpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkpoints/1 or /checkpoints/1.json
  def destroy
    @checkpoint.destroy
    respond_to do |format|
      format.html { redirect_to checkpoints_url, notice: "Checkpoint was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkpoint
      @checkpoint = Checkpoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def checkpoint_params
      params.require(:checkpoint).permit(:check_at, :handle, :description)
    end
end
