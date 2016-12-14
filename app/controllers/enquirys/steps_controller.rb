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

    #werkt niet, could not find EnquiryMeasure with 'id'=
    #@enquiry_measure = EnquiryMeasure.find(params[:enquiry_measure_id])
   #@enquiry_measure.update(enquiry_measure_params(step))

    render_wizard @enquiry
  end

  private

  def enquiry_params(step)
    permitted_attributes = case step
                             when "basic"
                               [:reference, :description, :location]
                             when "when"
                               [:amount, :date]
                             when "measurements"
                               [:responsible, :needed, :done]
                           #  when "createmeasures"
                            #   [:measurement]
                           end

    params.require(:enquiry).permit(permitted_attributes).merge(form_step: step)
    #params.require(:enquiry_measures).permit(permitted_attributes).merge(form_step: step)
  end

end
