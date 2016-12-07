class Enquirys::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Enquiry.form_steps


  def show
    @enquiry = Enquiry.find(params[:enquiry_id])
    #@enquiry_measures = EnquiryMeasure.find(params[:enquiry_measure_id])
    render_wizard
  end

  def update
    @enquiry = Enquiry.find(params[:enquiry_id])
    @enquiry.update(enquiry_params(step))

    #@enquiry_measure = EnquiryMeasure.find(params[:enquiry_measure_id])
    #@enquiry_measure.update(enquiry_measure_params(step))

    render_wizard @enquiry
  end

  private

  def enquiry_params(step)
    permitted_attributes = case step
                             when "basic"
                               [:Reference, :Location, :Description]
                             when "when"
                               [:Amount, :Date]
                             when "measurements"
                               [:responsible]
                             when "createmeasures"
                               [:measurement]
                           end

    params.require(:enquiry).permit(permitted_attributes).merge(form_step: step)
  end


end
