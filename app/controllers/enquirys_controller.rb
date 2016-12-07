class EnquirysController < ApplicationController
  before_action :set_enquiry, only: [:show, :edit, :update, :destroy]


  def index
    # Normally you'd have more complex requirements about
    # when not to show rows, but we don't show any records that don't have a name
    @enquirys = Enquiry.where.not(reference: nil)

    #voor het toevoegen van maatregelen. test!
    @measures = Measure.where.not(measurement: nil)
      #@enquirymeasure = EnquiryMeasure.where.not(enquiry_measure_id: nil)

  end

  def new
    @enquiry = Enquiry.new
    #voor het toevoegen van maatregelen. test!
    @enquiry_measure = EnquiryMeasure.new
    @measure = Measure.new
  end

  def create
    @enquiry = Enquiry.new
    #@enquiry_measure = EnquiryMeasure.new
    @enquiry.save(validate: false)
    #@enquiry_measure.save(validate: false)
    redirect_to enquiry_step_path(@enquiry, Enquiry.form_steps.first)
  end

  def show
    @enquiry = Enquiry.find(params[:enquiry_id])
  end

  def destroy
    @enquiry.destroy
    respond_to do |format|
      format.html { redirect_to enquirys_url }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_enquiry
    @enquiry = Enquiry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  #Nodig voor het opslaan en tonen van items! alle weer te geven dingen dienen in de params te staan.
  def enquiry_params
    params.require(:enquiry).permit(:Reference, :Location, :Date, :Time, :Amount)
  end

#  def enquirymeasure_params_params
#   params.require(:enquirymeasure).permit(:done, :responsible, :needed)
#  end

end