class Enquiry < ActiveRecord::Base
  #ophalen van andere tabellen voor het formulier. Has_many is 1 op veel relatie
  #accepts_nested_attributes Nested attributes allow you to save attributes on associated records through the paren
  # de dere regel zorgt ervoor dat de maatregelen worden opgehaald via de tussentabel enquiry_measures.

  has_many :enquiry_measures, :class_name => 'EnquiryMeasure' #, inverse_of: :Enquiry
  accepts_nested_attributes_for :enquiry_measures, :allow_destroy => true

  has_many :measures, -> { uniq }, :class_name => 'Measure', :through => :enquiry_measures, dependent: :destroy
  accepts_nested_attributes_for :measures, :allow_destroy => false

  has_many :controls, :class_name => 'Control' #, inverse_of: :Enquiry

  has_many :applicants, :class_name => 'Applicant' #, inverse_of: :Enquiry

  has_many :agrees, :class_name => 'Agree' #, inverse_of: :Enquiry

  has_many :signatures, :class_name => 'Signature' #, inverse_of: :Enquiry
  accepts_nested_attributes_for :signatures, :allow_destroy => false

  has_many :tools, :class_name => 'Tool', :dependent => :destroy  #, inverse_of: :Enquiry
  accepts_nested_attributes_for :tools, :allow_destroy => true

  #:dependent => :destroy  zorgt ervoor dat de foreign record ook word verwijderd.

  #de instances van andere tabellen:

  e = Enquiry.new
  e.enquiry_measures.build(:enquiry_id => :id)
  e.measures.build


  # 28-11 MG de pagina's die in het form worden gebruikt.
  cattr_accessor :form_steps do
    %w(basic when measurements tool)
  end

  attr_accessor :form_step

  validates :reference, presence: true, if: -> { required_for_step?(:basic) }
  validates :amount, :date, presence: true, if: -> { required_for_step?(:when) }
  #validates :needed, presence: true, if: -> { required_for_step?(:measurements) }

  def required_for_step?(step)
    return true if form_step.nil?
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end

  #voor het mailen met behulp van de mailgem:
  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
        :subject => "My Contact Form",
        :to => "marco.groenhof@jpbgroep.nl",
        :from => %("#{name}" <#{email}>)
    }
  end

end
