class Measure < ActiveRecord::Base
belongs_to :enquiry_measure
  def to_json
  end
end
