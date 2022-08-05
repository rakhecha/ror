class AddDayOfMonthToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :day_of_month, :string
  end
end
