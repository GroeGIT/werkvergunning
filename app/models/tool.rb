class Tool < ActiveRecord::Base
  belongs_to :enquiry,
             inverse_of: :tools
  #validates_presence_of :enquiry
end
