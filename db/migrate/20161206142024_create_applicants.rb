class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.column :name, :string
      t.column :email, :string
      t.has_many :contractors, index: true
      t.timestamps null: false
    end
  end
end
