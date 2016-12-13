class FixColumnType < ActiveRecord::Migration
  def change
    change_table :measures do |t|
      t.rename :type, :measurementtype
    end
  end
end
