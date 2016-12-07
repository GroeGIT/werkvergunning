class Contractor < ActiveRecord::Base
  has_many :applicant, :class_name => 'Applicant'
end
