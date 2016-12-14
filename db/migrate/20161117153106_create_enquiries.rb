class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :reference
      t.string :location
      t.text :description
      t.integer :amount
      t.date :date
      t.time :time

      t.timestamps null: false
    end
  end
end
