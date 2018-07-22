class DoctorprofilesController < ApplicationController
  before_action :set_doctorprofile, only: [:show, :update, :destroy]

  # GET /doctorprofiles
  def index
    @doctorprofiles = Doctorprofile.all

    render json: @doctorprofiles
  end

  # GET /doctorprofiles/1
  def show
    render json: @doctorprofile
  end

  # POST /doctorprofiles
  def create
    @doctorprofile = Doctorprofile.new(doctorprofile_params)

    if @doctorprofile.save
      render json: @doctorprofile, status: :created, location: @doctorprofile
    else
      render json: @doctorprofile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doctorprofiles/1
  def update
    if @doctorprofile.update(doctorprofile_params)
      render json: @doctorprofile
    else
      render json: @doctorprofile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctorprofiles/1
  def destroy
    @doctorprofile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctorprofile
      @doctorprofile = Doctorprofile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doctorprofile_params
      params.require(:doctorprofile).permit(:first_name, :last_name, :clinic_affiliation, :sub_specialty_english, :sub_specialty_spanish, :phone_nuber_string, :notes_string)
    end
end
