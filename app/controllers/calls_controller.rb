
class CallsController < ApplicationController
  before_action :set_call, only: %i[ show edit update destroy ]
  before_action :set_role

  # GET /calls or /calls.json
  def index
    if current_user
      @calls = @calls_provider.all
    else
      redirect_to login_path
    end
  end

  # GET /calls/1 or /calls/1.json
  def show
  end

  # GET /calls/new
  def new
    @call = Call.new
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls or /calls.json
  def create
    @call = Call.new(availability_params)
    @call.coach = current_user

    respond_to do |format|
      if @call.save
        format.html { redirect_to call_url(@call), notice: "Call was successfully created." }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1 or /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to call_url(@call), notice: "Call was successfully updated." }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1 or /calls/1.json
  def destroy
    @call.destroy!

    respond_to do |format|
      format.html { redirect_to calls_url, notice: "Call was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def call_params
      params.require(:call).permit(:coach_id, :student_id, :start, :satisfaction, :notes)
    end

    def availability_params
      params.require(:call).permit(:start)
    end

    def set_role
      @calls_provider = CallsProviderFactory.for(current_user)
      @role ||= current_user && current_user.type == "Coach" ? :coach : :student
    end
end
