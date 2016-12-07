class AddEnquiryToEquipment < ActiveRecord::Migration
  def change
    add_reference :equipment, :enquiry, index: true, foreign_key: true
  end
end
