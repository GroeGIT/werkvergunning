class BooleantotextEm < ActiveRecord::Migration
  def change
    change_table :enquiry_measures do |t|
      t.change :done, :text
      t.change :needed, :text
    end
  end
end
