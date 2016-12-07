class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.column :handtool, :string
      t.column :equipment, :string
      t.column :else, :string
      t.timestamps null: false
    end
  end
end
