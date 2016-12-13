class EnquiryMeasure < ActiveRecord::Base
	belongs_to :enquiry#, inverse_of: :enquiry_measures
	validates_presence_of :enquiry
	has_many :measure

end
