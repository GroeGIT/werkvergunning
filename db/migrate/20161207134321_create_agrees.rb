class CreateAgrees < ActiveRecord::Migration
  def change
    create_table :agrees do |t|
      t.column :name, :string
      t.timestamps null: false
    end
  end
end
