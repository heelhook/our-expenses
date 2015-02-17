json.array!(@expenses) do |expense|
  json.extract! expense, :id, :name, :amount, :periodicity, :notes, :due_on
  json.url expense_url(expense, format: :json)
end
