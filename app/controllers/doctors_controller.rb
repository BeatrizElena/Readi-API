# 7/31: changed from ApplicationController to OpenReadController
class DoctorsController < OpenReadController
  before_action :set_doctor, only: [:show, :update, :destroy]

  # GET /doctors
  def index
    @doctors = Doctor.all

    render json: @doctors
  end

  # GET /doctors/1
  def show
    render json: @doctor
  end

  # POST /doctors
  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: @doctor, status: :created, location: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doctors/1
  def update
    if @doctor.update(doctor_params)
      render json: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctors/1
  def destroy

    doctor_sessions = Session.where(:user_id => current_user[:id], :doctor_id => @doctor)
    doctor_sessions.destroy_all
    @doctor.destroy

    head :no_content
  end

  # private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doctor_params
      params.require(:doctor)
            .permit(:first_name, :last_name, :clinic_affiliation, :sub_specialty_english, :sub_specialty_spanish, :phone_number)
    end

    private :set_doctor, :doctor_params
end
