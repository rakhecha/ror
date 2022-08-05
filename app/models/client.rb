class Client < ApplicationRecord
    has_many :invoices, dependent: :destroy
    validates :company_name, presence: true
    validates :billing_address, presence: true
    validates :phone_number, presence: true
    validates :gst, format: { with: /\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}/ },:uniqueness => true, :presence => true
    encrypts :gst
end
