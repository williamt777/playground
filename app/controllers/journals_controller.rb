class JournalsController < ApplicationController

  before_action :set_journal, only: [:show, :destroy]

  # GET /journals
  def index
    @journals = Journal.all

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /journals/1
  def show
  end

  # GET /journals/new
  # Create a new journal for this student
  # def new
  #   @journal = Journal.new
  #   @student = Student.find( params["student"])
  # end

  # GET /journals/1/edit
  # def edit
  #   @journal.happened_at = Time.zone.yesterday if @journal.happened_at.nil?
  # end

  # POST /journals
  # def create
  #   @journal = Journal.new(journal_params)
  #   @student = Student.find params["student_id"] # journal must have a student
  #   @journal.student = @student

  #   respond_to do |format|
  #     if @journal.save
  #       format.html { redirect_to @journal, notice: 'Journal was successfully created.' }
  #     else
  #       format.html { render :new }
  #     end
  #   end
  # end

  # PATCH/PUT /journals/1
  # def update
  #   respond_to do |format|
  #     if @journal.update(journal_params)
  #       format.html { redirect_to @journal, notice: 'Juornal was successfully updated.' }
  #     else
  #       format.html { render :edit }
  #     end
  #   end
  # end

  # DELETE /journals/1
  # def destroy
  #   @journal.destroy
  #   redirect_to journals_url, notice: 'Journal was successfully destroyed.'
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_journal
    @journal = Journal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def journal_params
    params.require(:journal).permit(:comment, :student_id)
  end

end
