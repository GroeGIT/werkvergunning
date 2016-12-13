class FixColumnType2 < ActiveRecord::Migration
  def change
    change_table :measures do |t|
      t.rename :measurementtype, :measurement_type
      end
  end
end
