class AppointmentsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])
  end

  # GET /appointments/new
  def new
    # @business = Business.find(@current_business.id)
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @employee = Employee.find_by(id: params[:employee_id])

    respond_to do |format|
      @appointment.employee_id = @employee.id
      service = @employee.services[0].service_type
      service_type = Service.find_by(service_type: service)
      @appointment.service_id = service_type.id

      if @appointment.save
        format.html { redirect_to "/businesses/#{session[:business_id]}", notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    @appointment = Appointment.find_by(id: params[:id])
    if @appointment.update(appointment_params)
      AppointmentMailer.confirm_email("seatd.booked@gmail.com", @appointment).deliver_now
      render json: { }, status: :ok
    else
      render json: { }, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:start_time, :end_time, :client_id, :service_id, :employee_id, :booked)
    end
end
