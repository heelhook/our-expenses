json.array!(@dues) do |due|
  json.extract! due, :id, :due_by_id, :due_to_id, :due_from_id, :amount, :payment_id
  json.url due_url(due, format: :json)
end
