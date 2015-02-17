class ExpenseDueOn < ActiveRecord::Migration
  def change
    add_column :expenses, :due_on, :date
  end
end
