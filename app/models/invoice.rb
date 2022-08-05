class Invoice < ApplicationRecord
  belongs_to :client
  validates :amount, presence: true
  validates :currency, presence: true
  validates :contract_type, presence: true
  validates :payment_cycle, presence: true
  validates :client_id, presence: true

  before_validation :generate_invoice_number
  private
  def generate_invoice_number
    if Invoice.maximum("invoice").nil?
      self.invoice = 1000
    else
      self.invoice = Invoice.maximum("invoice") + 1
    end
  end
end
