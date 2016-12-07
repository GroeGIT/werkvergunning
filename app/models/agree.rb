class Agree < ActiveRecord::Base
  has_many :enquiry, :class_name => 'Enquiry'
end
