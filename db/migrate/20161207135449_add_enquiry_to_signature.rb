class AddEnquiryToSignature < ActiveRecord::Migration
  def change
    add_reference :signatures, :enquiry, index: true, foreign_key: true
  end
end
