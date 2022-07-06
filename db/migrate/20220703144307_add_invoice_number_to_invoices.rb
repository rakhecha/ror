class AddInvoiceNumberToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :invoice, :integer
  end
end
