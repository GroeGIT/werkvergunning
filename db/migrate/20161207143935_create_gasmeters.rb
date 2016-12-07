class CreateGasmeters < ActiveRecord::Migration
  def change
    create_table :gasmeters do |t|
      t.column :date, :date
      t.column :time, :time
      t.column :tester, :string
      t.column :signature, :string
      t.column :oxigen, :string
      t.column :oxigenneeded, :boolean
      t.column :oxigencontinu, :string
      t.column :explosive, :string
      t.column :explosiveneeded, :boolean
      t.column :explosivecontinu, :string
      t.column :mat1, :string
      t.column :mat1needed, :boolean
      t.column :mat1continu, :string
      t.column :mat2, :string
      t.column :mat2needed, :boolean
      t.column :mat2continu, :string
      t.column :mat3, :string
      t.column :mat3needed, :boolean
      t.column :mat3continu, :string
      t.timestamps null: false
    end
  end
end
