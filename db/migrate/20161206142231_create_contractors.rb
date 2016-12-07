class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
        t.column :name, :string
        t.column :email, :string
      t.timestamps null: false
    end
  end
end
