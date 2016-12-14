class ChangeEnquiry < ActiveRecord::Migration
  def change

    change_table :enquiries do |t|
      t.rename :Reference, :reference
      t.rename :Location, :location
      t.rename :Description, :description
      t.rename :Amount, :amount
      t.rename :Date, :date
      t.rename :Time, :time
end
  end
end
