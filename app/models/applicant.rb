class Applicant < ActiveRecord::Base
  belongs_to :enquiry, :class_name => 'Enquiry' #, inverse_of: :applicant
  validates_presence_of :enquiry
  has_many :contractor, :class_name => 'Contractor'
end
