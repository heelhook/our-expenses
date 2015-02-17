json.array!(@payments) do |payment|
  json.extract! payment, :id, :paid_by_id, :paid_to_id, :ticket_id, :amount, :memo
  json.url payment_url(payment, format: :json)
end
