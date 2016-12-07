class Enquiry < ActiveRecord::Base
  #ophalen van andere tabellen voor het formulier. Has_many is 1 op veel relatie
  #accepts_nested_attributes Nested attributes allow you to save attributes on associated records through the paren
  # de dere regel zorgt ervoor dat de maatregelen worden opgehaald via de tussentabel enquiry_measures.

  has_many :enquiry_measures, :class_name => 'EnquiryMeasure' #, inverse_of: :Enquiry
  accepts_nested_attributes_for :enquiry_measures, :allow_destroy => false

  has_many :measures, -> { uniq }, :class_name => 'Measure', :through => :enquiry_measures, dependent: :destroy

  has_many :controls, :class_name => 'Control' #, inverse_of: :Enquiry

  has_many :applicants, :class_name => 'Applicant' #, inverse_of: :Enquiry

  has_many :agrees, :class_name => 'Agree' #, inverse_of: :Enquiry

  has_many :signatures, :class_name => 'Signature' #, inverse_of: :Enquiry
  accepts_nested_attributes_for :signatures, :allow_destroy => false

  has_many :tools, :class_name => 'Tool' #, inverse_of: :Enquiry


# 28-11 MG de pagina's die in het form worden gebruikt.
  cattr_accessor :form_steps do
    %w(basic when measurements)
  end

  attr_accessor :form_step

  validates :Reference, :Location, presence: true, if: -> { required_for_step?(:basic) }
  validates :Amount, :Date, presence: true, if: -> { required_for_step?(:when) }
  validates :needed, presence: true, if: -> { required_for_step?(:measurements) }
#validates :needed, :measurement, presence: true, if: -> { required_for_step?(:createmeasures) }


  def required_for_step?(step)
    return true if form_step.nil?
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end


end
