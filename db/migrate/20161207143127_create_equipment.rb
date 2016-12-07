class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.column :motorvehicle, :boolean
      t.column :compressor, :boolean
      t.column :ramp, :boolean
      t.column :scaffold, :boolean
      t.column :crane, :boolean
      t.column :ladder, :boolean
      t.column :generator, :boolean
      t.column :tankladder, :boolean
      t.timestamps null: false
    end
  end
end
