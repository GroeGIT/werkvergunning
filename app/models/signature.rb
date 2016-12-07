class Signature < ActiveRecord::Base
  belongs_to :enquiry, :class_name => 'Enquiry'
   has_many :representatives, :class_name => 'Representative'
end
