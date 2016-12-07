class Representative < ActiveRecord::Base
  belongs_to :signature, :class_name => 'Signature' #, inverse_of: :signature
  validates_presence_of :signature

end
