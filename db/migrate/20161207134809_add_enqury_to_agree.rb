class AddEnquryToAgree < ActiveRecord::Migration
  def change
    add_reference :agrees, :enquiry, index: true, foreign_key: true
  end
end
