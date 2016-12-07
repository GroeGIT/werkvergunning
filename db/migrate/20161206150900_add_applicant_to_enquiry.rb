class AddApplicantToEnquiry < ActiveRecord::Migration
  def change
    add_reference :enquiries, :applicant, index: true, foreign_key: true
  end
end
