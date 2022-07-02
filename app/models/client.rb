class Client < ApplicationRecord
    validates :company_name, presence: true
    validates :billing_address, presence: true
    validates :phone_number, presence: true
end
