class Invoice < ApplicationRecord
  belongs_to :client
  validates :amount, presence: true
  validates :currency, presence: true
  validates :contract_type, presence: true
  validates :payment_cycle, presence: true
  validates :client_id, presence: true
end
