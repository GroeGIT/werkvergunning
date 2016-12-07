class AddEnquiryToGasmeter < ActiveRecord::Migration
  def change
    add_reference :gasmeters, :enquiry, index: true, foreign_key: true
  end
end
