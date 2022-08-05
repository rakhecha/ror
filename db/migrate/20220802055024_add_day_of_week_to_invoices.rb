class AddDayOfWeekToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :day_of_week, :string
  end
end
