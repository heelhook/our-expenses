class Payment < ActiveRecord::Base
  belongs_to :paid_by, class_name: 'User'
  belongs_to :paid_to, class_name: 'User'
  belongs_to :ticket
  has_many :dues, dependent: :nullify
  has_many :tickets, through: :dues, source: :due_from, source_type: 'Ticket'

  monetize :amount_cents

  attr_accessor :autocalculated

  def initialize(v={})
    @autocalculated = false
    super
  end
end
