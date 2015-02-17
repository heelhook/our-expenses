class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.money :amount
      t.string :periodicity
      t.text :notes

      t.timestamps null: false
    end
  end
end
