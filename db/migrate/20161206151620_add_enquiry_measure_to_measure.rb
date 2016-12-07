class AddEnquiryMeasureToMeasure < ActiveRecord::Migration
  def change
    add_reference :measures, :enquiry_measure, index: true, foreign_key: true
  end
end
