class Due < ActiveRecord::Base
  belongs_to :due_by, class_name: 'User'
  belongs_to :due_to, polymorphic: true
  belongs_to :due_from, polymorphic: true
  belongs_to :payment

  monetize :amount_cents

  def paid?
    !!payment
  end
end
