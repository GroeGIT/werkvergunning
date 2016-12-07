class CreateControls < ActiveRecord::Migration
  def change
    create_table :controls do |t|
      t.belongs_to :enquiry, index: true
      t.column :enquiry_check, :boolean
      t.column :workspace_check, :boolean
      t.timestamps null: false
    end
  end
end
