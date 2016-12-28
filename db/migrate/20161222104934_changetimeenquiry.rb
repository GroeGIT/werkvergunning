class Changetimeenquiry < ActiveRecord::Migration
  def change
    def change
      change_table Enquiry do |t|
        t.remove :time
        t.change :date, :datetime
      end
    end
  end
end
