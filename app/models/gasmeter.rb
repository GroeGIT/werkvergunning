class Gasmeter < ActiveRecord::Base
  belongs_to :enquiry, :class_name => 'Enquiry' #, inverse_of: :applicant
  validates_presence_of :enquiry
end
