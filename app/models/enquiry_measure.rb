class EnquiryMeasure < ActiveRecord::Base
	belongs_to :enquiry#, inverse_of: :enquiry_measures
	validates_presence_of :enquiry
	has_many :measure
#serialize zodat de data uit de collection select met multiple: true op kan worden geslagen.
	serialize :measure

end
