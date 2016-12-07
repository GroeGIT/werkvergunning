class AddApplicantToContractor < ActiveRecord::Migration
  def change
    add_reference :contractors, :applicant, index: true, foreign_key: true
  end
end
