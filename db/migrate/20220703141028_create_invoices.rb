class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :amount
      t.string :currency
      t.string :contract_type
      t.string :payment_cycle
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
