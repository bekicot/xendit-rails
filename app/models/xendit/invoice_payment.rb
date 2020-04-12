# frozen_string_literal: true

module Xendit
  class InvoicePayment < ApplicationRecord
    alias_attribute :is_high, :high

    ATTRIBUTES = %i[invoice_id
                    user_id
                    external_id
                    high
                    is_high
                    merchant_name
                    amount
                    status
                    payer_email
                    description
                    fees_paid_amount
                    adjusted_received_amount
                    bank_code
                    retail_outlet_name
                    ewallet_type
                    on_demand_link
                    paid_amount
                    mid_label
                    currency
                    success_redirect_url
                    failure_redirect_url
                    paid_at
                    credit_card_charge_id
                    payment_method
                    payment_channel
                    payment_destination].freeze
  end
end
