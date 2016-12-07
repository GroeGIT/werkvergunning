class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :phone, :integer
      t.timestamps null: false
    end
  end
end
