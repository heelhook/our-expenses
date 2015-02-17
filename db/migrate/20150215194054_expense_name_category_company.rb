class ExpenseNameCategoryCompany < ActiveRecord::Migration
  def change
    remove_column :expenses, :name
    add_column :expenses, :category, :string
    add_column :expenses, :company, :string
  end
end
