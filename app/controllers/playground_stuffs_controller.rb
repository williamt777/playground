class PlaygroundStuffsController < ApplicationController
  before_action :set_playground_stuff, only: %i[ show edit update destroy ]

  # GET /playground_stuffs
  def index
    @playground_stuff = PlaygroundStuff.the_singleton
  end

  # GET /playground_stuffs/1
  def show
  end

  # GET /playground_stuffs/1/edit
  def edit
    @users = User.all
    school1 = @playground_stuff.cur_school
    @students = Student.all_students(school1)
  end

  # PATCH/PUT /playground_stuffs/1 or /playground_stuffs/1.json
  def update
    p1 = playground_stuff_params

    if @playground_stuff.update(p1)
      @playground_stuff.check_after_update
      redirect_to playground_stuffs_path, notice: "Playground stuff was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playground_stuff
      @playground_stuff = PlaygroundStuff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playground_stuff_params
      p2 = params.require(:playground_stuff).permit(:fun_message, :user_id,
                                               :student_id, :school_ignore)
      p2.delete("school_ignore")
      p2
    end
end
