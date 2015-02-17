class PaymentCompleterService
  attr_reader :payment

  def initialize(payment)
    @payment = payment
  end

  def complete!
    @payment.autocalculated = true

    users = Hash.new { |hash, key| hash[key] = 0 }

    @payment.dues.each do |due|
      users[due.due_to_id] += 0
      users[due.due_by_id] += due.amount_cents
    end

    raise "Can't complete payment with those dues" if users.length != 2

    debtor, debtor_amount = users.max_by {|k,v| v}
    creditor, creditor_amount = users.min_by {|k,v| v}

    @payment.paid_by_id = debtor
    @payment.paid_to_id = creditor
    @payment.amount_cents = debtor_amount - creditor_amount
  end
end
