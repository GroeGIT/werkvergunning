class AddEnquiryToTool < ActiveRecord::Migration
  def change
    add_reference :tools, :enquiry, index: true, foreign_key: true
  end
end
