class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.column :date, :date
      t.column :time, :time
      t.column :signature, :string

      t.timestamps null: false
    end
  end
end
